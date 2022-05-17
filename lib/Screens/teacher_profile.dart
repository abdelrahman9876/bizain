// ignore_for_file: must_be_immutable

import 'package:another_flushbar/flushbar.dart';
import 'package:e_learning/Controllers/authentication_controller.dart';
import 'package:e_learning/Models/profile_response_model.dart';
import 'package:e_learning/Screens/upload.dart';
import 'package:e_learning/Widgets/vedio_item.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/helpers/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';

import 'content_screen.dart';

class TeacherProfile extends StatelessWidget {
  SizeConfig sizeConfig=SizeConfig();
  bool isSelected;
  final AuthenticationController controller =
  Get.put(AuthenticationController());
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  TeacherProfile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('الصفحه الشخصيه',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold)),
        leading: Icon(Icons.arrow_back,color: accentColor,),
        backgroundColor: buttonTextColor,
      ),
      body: FutureBuilder<ProfileResponseModel>(
             future: controller.getProfileData(),
          builder: (context,snapshot){
               if(snapshot.hasData){
               //  print('message ${snapshot.data.message}');
                 Flushbar(message: snapshot.data.message,
                   titleColor: Colors.red,
                   flushbarPosition: FlushbarPosition.TOP,  flushbarStyle: FlushbarStyle.FLOATING,
                   reverseAnimationCurve: Curves.decelerate,
                   forwardAnimationCurve: Curves.elasticOut,    backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
                   isDismissible: false,
                   duration: Duration(seconds: 4),);
                 // Fluttertoast.showToast(msg:snapshot.data.message );
                 return
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Container(
                             margin: EdgeInsets.only(right: sizeConfig.screenWidth*.1,top: sizeConfig.screenHeight*.1),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Column(
                                   children: [
                                     Text('${snapshot.data.name}',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                                     Text('${snapshot.data.specialization}',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                                   ],
                                 ),
                                 // CircleAvatar(
                                 //   backgroundImage: AssetImage('assets/teacher.jpg'),
                                 // )
                               ],
                             ),
                           ),
                           Container(
                             margin: EdgeInsets.only(right: sizeConfig.screenWidth*.03,top: sizeConfig.screenHeight*.1),

                             child: Stack(
                               children: [
                                 CircleAvatar(
                                   radius: 40,
                                   backgroundImage: NetworkImage('${snapshot.data.image}'),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: sizeConfig.screenHeight*.07,right: sizeConfig.screenWidth*.03),
                                   child: FlatButton(
                                       minWidth: 80,
                                       height: 20,
                                       color: primaryColor,
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(10.0)),
                                       onPressed: (){
                                         //  Get.to(ConfirmPassword());
                                       }, child: Text('تعديل ',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 14),)),
                                 ),
                               ],
                             ),
                           )
                         ],
                       ),
                       Container(
                         margin: EdgeInsets.only(top: sizeConfig.screenHeight*.05),

                         child: Row(
                           mainAxisAlignment:MainAxisAlignment.spaceAround ,
                           children: [
                             Column(
                               children: [
                                 Text('109',style: TextStyle(color: accentColor,fontWeight: FontWeight.bold,fontSize: 18),),
                                 Text('منشور')
                               ],
                             ),
                             Column(
                               children: [
                                 Text('${snapshot.data.followedBy} M',style: TextStyle(color: accentColor,fontWeight: FontWeight.bold,fontSize: 18)),
                                 Text('متابع')
                               ],
                             ),
                             Column(
                               children: [
                                 Text('${snapshot.data.following}',style: TextStyle(color: accentColor,fontWeight: FontWeight.bold,fontSize: 18)),
                                 Text('')
                               ],
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(right: sizeConfig.screenWidth*.1,top: sizeConfig.screenHeight*.04),

                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text('المجله',textAlign: TextAlign.right,style: TextStyle(color: accentColor,fontWeight: FontWeight.bold,fontSize: 18)),
                           ],
                         ),
                       ),
                       // Container(
                       //     margin: EdgeInsets.only(right: sizeConfig.screenWidth*.07,top: sizeConfig.screenHeight*.04,left: sizeConfig.screenWidth*.07),
                       //
                       //     child: Image.asset('assets/teacher.jpg')),


                       Expanded(
                         child: SizedBox(
                           height: sizeConfig.screenHeight*2,
                           width:sizeConfig.screenWidth,
                           child: ListView.builder(
                             itemCount: snapshot.data.videos.length,
                               itemBuilder: (context,index){
                             return Container(
                               child: VideoItems(
                                 videoPlayerController:
                                 VideoPlayerController
                                     .network(
                                     '${snapshot.data?.videos[index]}'),
                                 looping: true,
                                 autoplay: false,
                                 width:sizeConfig.screenWidth,
                                 fit: BoxFit.cover,
                               ),
                             );
                           }),
                         ),
                       )
                     ],
                   );
               }else{
                 return Center(child: CircularProgressIndicator(),);
               }
          }),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor:primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:  [
          BottomNavigationBarItem(
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
  }
}
