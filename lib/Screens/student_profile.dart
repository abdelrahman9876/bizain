// ignore_for_file: must_be_immutable

import 'package:e_learning/Controllers/student_controller.dart';
import 'package:e_learning/Models/student_model.dart';
import 'package:e_learning/Screens/current_student_profile.dart';
import 'package:e_learning/Widgets/error_widget.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentProfile extends StatelessWidget {
  SizeConfig sizeConfig=SizeConfig();
  bool isSelected;
  String error_message="";
   StudentProfile({Key key}) : super(key: key);
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
      body: FutureBuilder<StudentProfileResponse>(
        future: StudentController().getStudentProfile(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return HasError(errorText:error_message??'' ,);
          }else{
            if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
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
                                  Text('${snapshot.data.specialization??""}',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
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
                                        Get.to( UpdateStudentScreen());
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
                              Text('تتابع')
                            ],
                          )
                        ],
                      ),
                    ),


                  ],
                ),
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // currentIndex: snapshot.data.index,
        //  onTap: _bottomNavBarBloc.pickItem,
        items:  [
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Browse'),
            icon: Icon(Icons.person_rounded),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.add_circle,color: primaryColor,size: 50,),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.chat_bubble_outline,),
          ),
          BottomNavigationBarItem(
            title: Text('content'),
            icon: InkWell(
                onTap: (){

                  //Get.to(Content());
                },
                child:isSelected==true? Icon(Icons.content_paste,color: primaryColor,):Icon(Icons.content_paste)),
          ),
        ],
      ),

    );

  }
}
