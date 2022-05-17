import 'dart:convert';

import 'package:e_learning/Models/home_teacher_response_model.dart';
import 'package:e_learning/Models/student_model.dart';
import 'package:e_learning/Models/current_profile_model.dart';
import 'package:e_learning/Widgets/flushbar_helper.dart';
import 'package:e_learning/helpers/network_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio_package;

class StudentController extends GetxController{
  final NetworkUtil _networkUtil = NetworkUtil();
  RxBool isLoading = RxBool(false);
  Future<HomeResponseModel > getHomeStudent()async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    int id=prefs.getInt('id');
    String token=prefs.getString('token');
    String user_type=prefs.getString('user_type');

    Map<String,dynamic> formData =
    { "user_id":id.toString(),"user_type": user_type, "access_token": token};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/getstudenthome",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
       return HomeResponseModel.fromJson(jsonDecode(response.toString()));
    }else{
      isLoading.value=false;
      FlashHelper().errorBar(message: response.data['message']);

    }
  }
  Future<StudentProfileResponse > getStudentProfile()async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    int id=prefs.getInt('id');
    String token=prefs.getString('token');
    String user_type=prefs.getString('user_type');

    Map<String,dynamic> formData =
    { "user_id":id.toString(),"user_type": user_type, "access_token": token};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/getstudentprofile",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
      return StudentProfileResponse.fromJson(jsonDecode(response.toString()));
    }else{
      isLoading.value=false;
      FlashHelper().errorBar(message: response.data['message']);

    }
  }
  Future<UpdateProfileModel > getCurrentStudentProfile()async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    int id=prefs.getInt('id');
    String token=prefs.getString('token');
    String user_type=prefs.getString('user_type');

    Map<String,dynamic> formData =
    { "user_id":id.toString(),"user_type": user_type, "access_token": token};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/getstudentdata",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
      return UpdateProfileModel.fromJson(jsonDecode(response.toString()));
    }else{
      isLoading.value=false;
      FlashHelper().errorBar(message: response.data['message']);

    }
  }
  Future updateStudentProfile(

      {String name,String occupation,String bio,String image}) async {
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    int id=prefs.getInt('id');
    String token=prefs.getString('token');
    String user_type=prefs.getString('user_type');
    dio_package.FormData formData =
    dio_package.FormData.fromMap({"user_id": id.toString(), "user_type": user_type,"name":name,"occupation":occupation,"bio":bio,"image":image,"access_token":token});
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/updatestudentinfo",body: formData);
    if(response.statusCode==200){
      isLoading.value = false;
      FlashHelper().successBar(message: response.data['message']);

    }else{
      isLoading.value = false;
      FlashHelper().errorBar(message: response.data['message']);
    }
  }
}