import 'package:e_learning/Controllers/authentication_controller.dart';
import 'package:e_learning/Screens/verification_screen.dart';
import 'package:e_learning/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class SignUp extends StatelessWidget {
  final FocusNode _passwordFocus = FocusNode();

  final FocusNode _emailFocus = FocusNode();

  final RxBool isVisible = RxBool(false);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController mail = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
   SignUp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                        controller: name,
                         validator: (String value) {
                           if (value.isEmpty || value.length < 3) {
                             return ;
                           }
                         },
                        hintText: 'الاسم',),
                       CustomTextField(
                        controller: mail,
                         validator: (String value) {
                           if (value.isEmpty ||
                               !RegExp(r"[a-z0-9!#$%&'*+/=^_`{|}~-]+(:\.[a-z0-9!#$%&'*+/=^_`{|}~-]+)*@(:[a-z0-9](:[a-z0-9-]*[a-z0-9])\.)+[a-z0-9](:[a-z0-9-]*[a-z0-9])")
                                   .hasMatch(value)) {
                             return   ;
                           }
                         },
                        hintText: 'البريد الالكتروني',),
                       CustomTextField(

                         controller: password,
                         validator: (String value) {
                           if (value.isEmpty || value.length < 3) {
                             return ;
                           }
                         },
                         hintText: 'الرقم السري',),
                       CustomTextField(
                         controller: phoneNumber,
                         validator: (String value) {
                           if (value.isEmpty || value.length < 3) {
                             return ;
                           }
                         },
                         hintText: ' رقم الهاتف',),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: FlatButton(
                            minWidth: 350,
                            height: 60,
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: (){
                              _formKey.currentState.save();
                                if(_formKey.currentState.validate()){
                                  AuthenticationController().getRegisterResponse(
                                    name: name.text,
                                    email: mail.text,
                                    password: password.text,
                                    phone: phoneNumber.text

                                  );

                                }
                            }, child: Text('تسجيل الدخول',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 18),)),
                      ),
                      Center(
                        child: InkWell(
                          onTap: (){
                            Get.to(SignUp());
                          },
                          child: Text.rich(
                              TextSpan(
                                  text: 'لا تمتلك حساب؟',style:TextStyle(fontWeight: FontWeight.bold) ,
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: ' انشاء حساب',
                                      style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor),
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
  }
}
