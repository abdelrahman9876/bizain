import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:e_learning/Controllers/authentication_controller.dart';
import 'package:e_learning/Models/teacher_model.dart';
import 'package:e_learning/Screens/forget_password_screen.dart';
import 'package:e_learning/Screens/home_screen.dart';
import 'package:e_learning/Screens/sign_up_screen.dart';
import 'package:e_learning/Widgets/custom_text_field.dart';
import 'package:e_learning/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginStudent extends StatelessWidget {

  final FocusNode _passwordFocus = FocusNode();

  final FocusNode _emailFocus = FocusNode();

  final RxBool isVisible = RxBool(false);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController mail = TextEditingController();

  final TextEditingController password = TextEditingController();
  String token;
  int id;
  final AuthenticationController controller =
  Get.put(AuthenticationController());
  LoginStudent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>
      (
        init: AuthenticationController(),
        builder:(controller){
          return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset('assets/logo.png',height: 250,) ,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              //
                              // onSubmitted: (term) {
                              //   _emailFocus.unfocus();
                              //   FocusScope.of(context)
                              //       .requestFocus(_emailFocus);
                              // },
                              // validator: (String value) {
                              //   if (value.isEmpty ||
                              //       !RegExp(r"[a-z0-9!#$%&'*+/=^_`{|}~-]+(:\.[a-z0-9!#$%&'*+/=^_`{|}~-]+)*@(:[a-z0-9](:[a-z0-9-]*[a-z0-9])\.)+[a-z0-9](:[a-z0-9-]*[a-z0-9])")
                              //           .hasMatch(value)) {
                              //     return   ;
                              //   }
                              // },
                              controller: mail,
                              hintText: 'الايميل',),
                            CustomTextField(
                              controller: password,
                              validator: (String value) {
                                if (value.isEmpty || value.length < 3) {
                                  return ;
                                }
                              },
                              onSubmitted: (tern) => () {
                                _passwordFocus.unfocus();
                                FocusScope.of(context).unfocus();
                                // Hide KeyBord
                              },

                              hintText: 'الباسورد',),
                            InkWell(
                              onTap:(){
                                // Get.to(ForgetPassword());
                              },
                              child:Row(
                                children:const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('نسيت الباسورد؟',textAlign: TextAlign.left,style: TextStyle(fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 14,color: primaryColor),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:const EdgeInsets.only(top: 15),
                              child:FlatButton(
                                  minWidth:350,
                                  height:60,
                                  color:primaryColor,
                                  shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  onPressed:(){
                                    _formKey.currentState.save();

                                    controller.getLoginResponseStudent(
                                        email: mail.text,
                                        password: password.text
                                    );
                                    // Get.to(Home());


                                  }, child: const Text('تسجيل الدخول',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 18),)),
                            ),
                            Center(
                              child: InkWell(
                                onTap: (){
                                  // Get.to(SignUp());
                                },
                                child: const Text.rich(
                                    TextSpan(
                                        text: 'لا تمتلك حساب؟',style:TextStyle(fontWeight: FontWeight.bold) ,
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text:' انشاء حساب',
                                            style:TextStyle(fontWeight: FontWeight.bold,color: primaryColor),
                                          )
                                        ]
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );

        });

  }
}
