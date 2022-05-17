import 'package:e_learning/Controllers/authentication_controller.dart';
import 'package:e_learning/Screens/splash_screen.dart';
import 'package:e_learning/helpers/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/sign_up_screen.dart';
import 'Screens/student_login_screen.dart';

void main()async {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Login(),
    );
  }
}

