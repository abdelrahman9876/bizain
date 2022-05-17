// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:e_learning/Controllers/teacher_controller.dart';
import 'package:e_learning/Screens/teacher_profile.dart';
import 'package:e_learning/Widgets/custom_text_field.dart';
import 'package:e_learning/Widgets/vedio_item.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/helpers/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'content_screen.dart';

class Upload extends StatefulWidget {

   Upload({Key key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  File _video;
  VideoPlayerController _videoPlayerController;
  final  picker=ImagePicker();
  _pickVideo()async{
    final video=await picker.getVideo(source: ImageSource.gallery);
    _video=File(video.path);
    _videoPlayerController=VideoPlayerController.file(_video)
    ..initialize().then((_)  {
      setState(() {

      });
      _videoPlayerController.play();
    });
  }

  SizeConfig sizeConfig=SizeConfig();


  bool isSelected;

  final FocusNode _titleFocus = FocusNode();

  final FocusNode _descriptionFocus = FocusNode();

  final RxBool isVisible = RxBool(false);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();

  final TextEditingController description = TextEditingController();
   // final TeacherController controller=Get.put(TeacherController());

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
                 if(_video!=null)
                   _videoPlayerController.value.isInitialized?AspectRatio(
                     aspectRatio: _videoPlayerController.value.aspectRatio,
                     child: VideoPlayer(_videoPlayerController),
                   ):Container() else
                   Container(
                       margin: EdgeInsets.only(top: 20),

                       width: 300,
                     height: 100,
                     color: Colors.grey.shade200,
                       child: InkWell(
                         onTap: (){
                           _pickVideo();
                         },
                           child: Icon(Icons.cloud_upload_outlined,color: primaryColor,)))    ,
                // Container(
                //   height: 200,
                //   child: VideoItems(
                //     videoPlayerController:
                //     VideoPlayerController
                //         .file(file?.path??File('${file}'))
                //
                //     ,
                //     looping: true,
                //     autoplay: false, width:sizeConfig.screenWidth, fit: BoxFit.cover,
                //   ),
                // ),
                CustomTextField(
                  controller: title,
                  validator: (String value) {
                    if (value.isEmpty || value.length < 3) {
                      return ;
                    }
                  },
                  onSubmitted: (tern) => () {
                    _titleFocus.unfocus();
                    FocusScope.of(context).unfocus();
                    // Hide KeyBord
                  },
                  hintText: 'عنوان الغيديو',),
                CustomTextField(
                  controller: description,
                  validator: (String value) {
                    if (value.isEmpty || value.length < 3) {
                      return ;
                    }
                  },
                  onSubmitted: (tern) => () {
                    _descriptionFocus.unfocus();
                    FocusScope.of(context).unfocus();
                    // Hide KeyBord
                  },
                  hintText: 'وصف الفيديو',),
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
                          controller.uploadVedio(title: title.text,description: description.text,content:_video);
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
