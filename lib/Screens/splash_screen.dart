import 'dart:async';

import 'package:e_learning/Controllers/authentication_controller.dart';
import 'package:e_learning/Screens/home_screen.dart';
import 'package:e_learning/Screens/home_teacher.dart';
import 'package:e_learning/Screens/login_screen.dart';
import 'package:e_learning/Screens/magazine.dart';
import 'package:e_learning/Screens/student_profile.dart';
import 'package:e_learning/Screens/teacher_profile.dart';
import 'package:e_learning/Screens/upload.dart';
import 'package:e_learning/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // isLoggedIn(String email,String password)async{
  //   var isLogin=await AuthenticationController().getLoginResponse({
  //     "email":email,
  //     "password":password
  //   });
  //   if(isLogin.result==true){
  //     Get.to(HomeTeacher());
  //   }else{
  //     Get.to(Login());
  //   }
  //
  // }

  @override
  void initState(){
    // TODO:implement initState
    super.initState();
    // Timer(const Duration(seconds: 5),
    //         ()=>isLoggedIn("gullisofts@gmail.com","test")
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png',fit: BoxFit.cover,height: 200,)),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: CircularProgressIndicator(color: Colors.red,),
          // )
        ],
      ),
    );
  }
}
