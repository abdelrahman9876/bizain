import 'dart:convert';

import 'package:e_learning/Models/content_model.dart';
import 'package:e_learning/Models/home_teacher_response_model.dart';
import 'package:e_learning/Models/magazine_model.dart';
import 'package:e_learning/Widgets/flushbar_helper.dart';
import 'package:e_learning/helpers/network_util.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class ContentController extends GetxController{
  final NetworkUtil _networkUtil = NetworkUtil();
  RxBool isLoading = RxBool(false);
  Future<HomeResponseModel > getHomeContent()async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    var id=prefs.getInt('id');
    var token=prefs.getString('token');

    Map<String,dynamic> formData =
    { "user_id":id.toString(), "access_token": token};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/getcelebhome",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
      return HomeResponseModel.fromJson(jsonDecode(response.toString()));
    }else{
      isLoading.value=false;
      FlashHelper().errorBar(message: response.data['message']);

    }
  }

  Future<MagazineResponseModel > getMagazine()async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    var id=prefs.getInt('id');
    var token=prefs.getString('token');

    Map<String,dynamic> formData =
    { "user_id":id.toString(), "access_token": token};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/getappmagazine",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
      return MagazineResponseModel.fromJson(jsonDecode(response.toString()));
    }else{
      isLoading.value=false;
      FlashHelper().errorBar(message: response.data['message']);

    }
  }
  Future<ContentResponseModel > getVideos()async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    var id=prefs.getInt('id');
    var token=prefs.getString('token');

    Map<String,dynamic> formData =
    { "user_id":id.toString(), "access_token": token};
    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/getvideos",body: formData);
    if(response.statusCode==200){
      isLoading.value=false;
      return ContentResponseModel.fromJson(jsonDecode(response.toString()));
    }else{
      isLoading.value=false;
      FlashHelper().errorBar(message: response.data['message']);

    }
  }
}
