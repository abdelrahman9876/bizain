import 'package:e_learning/Screens/content_screen.dart';
import 'package:e_learning/Screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'upload_magazin.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({Key key}) : super(key: key);


  @override
  _AddContentScreenState createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('انشاء',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold)),
        leading: Icon(Icons.arrow_back,color: accentColor,),
        backgroundColor: buttonTextColor,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
                child: TextButton(onPressed: (){Get.to(Upload());}, child: Text('رفع فيديو',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))),
            Container(
              width: 200,
                margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor
                )
              ),
                child: TextButton(onPressed: (){
                  Get.to(UploadMagazine());
                }, child: Text('رفع علي المجله',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)))

          ],
        ),
      ),
    );
  }
}
