// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:e_learning/Controllers/authentication_controller.dart';
import 'package:e_learning/Widgets/custom_text_field.dart';
import 'package:e_learning/constants.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verification extends StatelessWidget {
   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String _email,_password,_passwordconfirm;
  TextEditingController codeController=TextEditingController();
  // OtpFieldController codeController = OtpFieldController();
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController= StreamController<ErrorAnimationType>();
    Verification({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/logo.png',height: 150,) ,
            Text('تحقق من رقمك مع الرموز المرسله لك',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 15,fontWeight: FontWeight.bold),),
            Form(
              key: _formKey,
                 child: Column(
                   children: [
                     TextField(
                       controller: codeController,
                     ),

                     // CustomTextField(
                     //   controller: codeController,
                     // )
                     // Padding(
                     //   padding: const EdgeInsets.all(8.0),
                     //   child: OTPTextField(
                     //     length: 8,
                     //     controller: codeController,
                     //     width: MediaQuery.of(context).size.width,
                     //     fieldWidth: 40,
                     //     style: TextStyle(
                     //         fontSize: 17
                     //     ),
                     //     textFieldAlignment: MainAxisAlignment.spaceAround,
                     //     fieldStyle: FieldStyle.box,
                     //     onCompleted: (pin) {
                     //       print("Completed: " + pin);
                     //     },
                     //   ),
                     // ),

                     Center(
                       child: InkWell(
                         onTap: (){
                          // Get.to(SignUp());
                         },
                         child: Text.rich(
                             TextSpan(
                                 text: 'لم اتلق الرمز',style:TextStyle(fontWeight: FontWeight.bold) ,
                                 children: <InlineSpan>[
                                   TextSpan(
                                     text: '  اعادة الارسال',
                                     style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor),
                                   )
                                 ]
                             )
                         ),
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: 25),
                       child: FlatButton(
                           minWidth: 350,
                           height: 60,
                           color: primaryColor,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.0)),
                           onPressed: ()async{

                             AuthenticationController().getActivateResponse(

                               otp: codeController.text
                             );
                           }, child: Text(' تاكيد',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 18),)),
                     ),

                   ],
                 ),
            ),
          ],
        ),
      ),
    );
  }
}
