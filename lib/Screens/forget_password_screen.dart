// import 'package:e_learning/Screens/confirm_password_screen.dart';
// import 'package:e_learning/Widgets/custom_text_field.dart';
// import 'package:e_learning/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: backgroundColor,
//       body: SafeArea(
//           child: Column(
//             children: [
//               Image.asset('assets/logo.png',height: 150,) ,
//               Text('تحقق من رقمك مع الرموز المرسله لك',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 15,fontWeight: FontWeight.bold),),
//               Form(
//                 child: Column(
//                   children: [
//                     Container(
//                         child: CustomTextField(hintText: 'الايميل',),margin: EdgeInsets.only(top: 20),),
//
//                     Container(
//                       margin: EdgeInsets.only(top: 25),
//                       child: FlatButton(
//                           minWidth: 350,
//                           height: 60,
//                           color: primaryColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0)),
//                           onPressed: (){
//                            Get.to(ConfirmPassword());
//                           }, child: Text(' ارسال',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 18),)),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )),
//     );
//
//   }
// }
