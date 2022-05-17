// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:e_learning/Models/login_student_model.dart';
import 'package:e_learning/Models/profile_response_model.dart';
import 'package:e_learning/Models/register_response_model.dart';
import 'package:e_learning/Models/teacher_model.dart';
import 'package:e_learning/Screens/home_screen.dart';
import 'package:e_learning/Screens/home_teacher.dart';
import 'package:e_learning/Screens/verification_screen.dart';
import 'package:e_learning/Widgets/flushbar_helper.dart';
import 'package:e_learning/helpers/network_util.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthenticationController extends GetxController{
  String token;
  final NetworkUtil _networkUtil = NetworkUtil();
  RxBool isLoading = RxBool(false);
  int id;
  LoginResponse loginResponse=LoginResponse();
  RegisterResponseModel registerResponse=RegisterResponseModel();
  ProfileResponseModel profileResponse=ProfileResponseModel();
  Future getLoginResponse(
  {String email,String password,Rxn<LoginResponse>loginResponse}) async {
    dio_package.FormData formData =
    dio_package.FormData.fromMap({"email": email, "password": password});
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/Auth/login",body: formData);
     if(response.statusCode==200){
       isLoading.value = false;
       SharedPreferences prefs=await SharedPreferences.getInstance();
       prefs.setInt("id", response.data["user_id"]);
       prefs.setString("token",response.data["access_token"] );
       Get.to(HomeTeacher());
     }else{
       isLoading.value = false;
       FlashHelper().errorBar(message: response.data['message']);
     }
  }
  Future getLoginResponseStudent(
      {String email,String password,Rxn<LoginStudentResponse>loginResponse}) async {
    dio_package.FormData formData =
    dio_package.FormData.fromMap({"login": email, "password": password});
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/Auth/s_login",body: formData);
    if(response.statusCode==200){
      isLoading.value = false;
        SharedPreferences prefs=await SharedPreferences.getInstance();
        prefs.setInt("id", response.data["user_id"]);
        prefs.setString("token",response.data["access_token"] );
        prefs.setString("user_type",response.data["user_type"] );
    LoginStudentResponse.fromJson(response.data);
    Get.to(Home());
    }
    else{
      isLoading.value = false;
      FlashHelper().errorBar(message: response.data['message']);
    }
  }
  Future getRegisterResponse(
  {String name,String email,String password,String phone,}) async {
    // ignore:non_constant_identifier_names
    Map<String,dynamic> formData =
    { "name":name,"email": email, "password": password,"phone":phone};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/Auth/s_register",body: formData);
    if(response.statusCode==200){
        isLoading.value=false;
        SharedPreferences prefs=await SharedPreferences.getInstance();
        prefs.setInt("user_id", response.data["user_id"]);
         print(response.data["user_id"]);
        FlashHelper().successBar(message: response.data['message']);

        RegisterResponseModel.fromJson(response.data);
       Get.to(Verification());
    }else{
      isLoading.value = false;
      FlashHelper().errorBar(message: response.data['message']);
    }

  }
  Future getActivateResponse({String otp})async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
   int id= prefs.getInt("user_id");
    Map<String,dynamic> formData =
    { "user_id":id.toString(),"otp": otp};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/Auth/s_activate",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
      FlashHelper().successBar(message: response.data['message']);

    }else{
      isLoading.value = false;
      FlashHelper().errorBar(message: response.data['message']);
    }
  }
  Future<ProfileResponseModel > getProfileData()async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    int id=prefs.getInt('id');
    String token=prefs.getString('token');
    dio_package.FormData formData =
    dio_package.FormData.fromMap( { "user_id":id.toString(),"access_token": token});
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/celebprofile",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
      return ProfileResponseModel.fromJson(jsonDecode(response.toString()));
    }else{
      isLoading.value=false;
      FlashHelper().errorBar(message: response.data['message']);

    }
  }
}