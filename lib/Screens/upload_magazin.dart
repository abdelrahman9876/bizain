import 'dart:io';

import 'package:e_learning/Controllers/teacher_controller.dart';
import 'package:e_learning/Screens/teacher_profile.dart';
import 'package:e_learning/Screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import 'content_screen.dart';

class UploadMagazine extends StatefulWidget {
  const UploadMagazine({Key key}) : super(key: key);


  @override
  _UploadMagazineState createState() => _UploadMagazineState();
}

class _UploadMagazineState extends State<UploadMagazine> {

  bool isSelected;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }}
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherController>(
        init:TeacherController() ,
        builder:(controller){

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('انشاء',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold)),
              leading: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back,color: accentColor,)),
              backgroundColor: buttonTextColor,
            ),
            body: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    if(_image!=null)
                   Image.file(_image, fit: BoxFit.cover) else
                      Container(
                          margin: EdgeInsets.only(top: 20),

                          width: 300,
                          height: 100,
                          color: Colors.grey.shade200,
                          child: InkWell(
                              onTap: (){
                                _openImagePicker();
                              },
                              child: Icon(Icons.cloud_upload_outlined,color: primaryColor,)))   ,

                    Container(
                      margin:const EdgeInsets.only(top: 15),
                      child:FlatButton(
                          minWidth:350,
                          height:60,
                          color:primaryColor,
                          shape:RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(10.0)),
                          onPressed:(){

                            _formKey.currentState?.save();
                            controller.uploadMagazine(file: _image);
                            // Flushbar(message: 'Uploading  Success',duration: Duration(seconds: 10),).show(context);

                          }, child: const Text(' حفظ',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 18),)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1,
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
                          child: const Text(' رفع المجله',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 18),)),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type:BottomNavigationBarType.fixed,
              fixedColor:primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items:  [
                const BottomNavigationBarItem(
                  title: Text('Search'),
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  title: Text('Browse'),
                  icon: InkWell(
                      onTap: (){
                        Get.to(TeacherProfile());
                      },
                      child: Icon(Icons.group_add)),
                ),
                BottomNavigationBarItem(
                  title: Text('Favorites'),
                  icon: InkWell(
                      onTap: (){
                        Get.to(Upload());

                      },
                      child: Icon(Icons.add_circle,color: primaryColor,size: 50,)),
                ),
                BottomNavigationBarItem(
                  title: Text('Profile'),
                  icon: InkWell(
                    onTap:(){
                      Get.to(Upload());
                    },
                    child:  Icon(Icons.chat_bubble_outline,),
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text('content'),
                  icon: InkWell(
                      onTap: (){
                        Get.to(Content());
                      },
                      child:isSelected==true? Icon(Icons.content_paste,color: primaryColor,):Icon(Icons.content_paste)),
                ),
              ],
            ),
          );
        });
  }
}
