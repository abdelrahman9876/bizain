import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:e_learning/Models/content_model.dart';
import 'package:e_learning/Models/file_response_model.dart';
import 'package:e_learning/Models/magazine_model.dart';
import 'package:e_learning/Models/upload_response_model.dart';
import 'package:e_learning/Widgets/flushbar_helper.dart';
import 'package:e_learning/helpers/network_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:dio/dio.dart' as dio_package;
class TeacherController extends GetxController{
  final NetworkUtil _networkUtil = NetworkUtil();
  RxBool isLoading = RxBool(false);
  Future uploadVedio(

      {String title,File content,String description}) async {
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    int id=prefs.getInt('id');
    String token=prefs.getString('token');

    dio_package.FormData formData =
    dio_package.FormData.fromMap({"user_id": id.toString(),"title":title,"description":description,"content_video":content,"access_token":token});

    final response= await _networkUtil.post("https://bayazin.earndawn.xyz/api/savevideo",body: formData);
    if(response.statusCode==200){
      isLoading.value = false;
      FlashHelper().successBar(message: response.data['message']);

    }else{
      isLoading.value = false;
      FlashHelper().errorBar(message: response.data['message']);
    }
  }
  Future uploadMagazine({File file})async{
    SharedPreferences prefs=await  SharedPreferences.getInstance();
    int id=prefs.getInt('id');
    String  token=prefs.getString('token');
    dio_package.FormData formData = dio_package.FormData.fromMap({
      "user_id": id.toString(),
      "access_token":token ,
      "content_file": file,
    });

    final response = await _networkUtil.post(
      'https://bayazin.earndawn.xyz/api/savefile',
        body: formData,
      );
    if (response.statusCode == 400)  {
      isLoading.value = false;
      FlashHelper().errorBar(message: response.data['message']);
    }
    if(response.statusCode==200){
         print('file uploaded successfully');
      return FileResponseModel.fromJson(response.data);

    }
  }
}
