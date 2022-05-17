

// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';

import 'package:another_flushbar/flushbar.dart';
import 'package:e_learning/Controllers/content_controller.dart';
import 'package:e_learning/Models/home_teacher_response_model.dart';
import 'package:e_learning/Screens/add_content_screen.dart';
import 'package:e_learning/Screens/content_screen.dart';
import 'package:e_learning/Screens/magazine.dart';
import 'package:e_learning/Screens/teacher_profile.dart';
import 'package:e_learning/Screens/upload.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeTeacher extends StatelessWidget {

   HomeTeacher({Key key}) : super(key: key);
  SizeConfig sizeConfig=SizeConfig();
  int index;
  bool isSelected;
  final ContentController controller=Get.put(ContentController());
   double rate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder< HomeResponseModel>(
        future:ContentController().getHomeContent() ,
        builder:(context,  snapshot) {
          print(ContentController().getHomeContent());

          if(snapshot.hasData){
            Flushbar(message: snapshot.data.message,
              titleColor: Colors.red,
              flushbarPosition: FlushbarPosition.TOP,  flushbarStyle: FlushbarStyle.FLOATING,
              reverseAnimationCurve: Curves.decelerate,
              forwardAnimationCurve: Curves.elasticOut,    backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
              isDismissible: false,
              duration: Duration(seconds: 4),);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: sizeConfig.screenWidth,
                    height: sizeConfig.screenHeight*.4,
                    child: Container(
                      margin: EdgeInsets.only(top:sizeConfig.screenHeight*.2,right:sizeConfig.screenWidth*.09 ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('صباح الخير',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontSize: 22,fontWeight: FontWeight.bold)),
                          Text('${snapshot?.data?.firstName}',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 17,fontWeight: FontWeight.bold)),
                          ListTile(
                            trailing: Text('سراء اسراء اسراء اسراء',style: TextStyle(color: textColor,fontFamily: 'Janna LT Regular',fontSize: 17,fontWeight: FontWeight.bold)),

                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: containerColor.withOpacity(.2),
                        borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30))
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20,top: 15),
                        child: Text('ماذا سوف تفعل اليوم؟',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold)),
                      )),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children:[
                      Container(
                        margin: EdgeInsets.only(top: sizeConfig.screenHeight*.05,left: sizeConfig.screenWidth*.03),
                        child: FlatButton(
                            minWidth: 100,
                            height: 40,
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: (){
                              //  Get.to(ConfirmPassword());
                            }, child: Text(' مشاهده',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 14),)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: sizeConfig.screenWidth*.1,top: sizeConfig.screenHeight*.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(' المحتوي الدراسي',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 12),),
                            SizedBox(width: sizeConfig.screenWidth*.08,),
                            Image.asset('assets/presentation.png')
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children:[
                      Container(
                        margin: EdgeInsets.only(top: sizeConfig.screenHeight*.05,left: sizeConfig.screenWidth*.03),
                        child: FlatButton(
                            minWidth: 100,
                            height: 40,
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: (){
                              //  Get.to(ConfirmPassword());
                            }, child: Text(' مشاهده ',style: TextStyle(color: buttonTextColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 14),)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: sizeConfig.screenWidth*.1,top: sizeConfig.screenHeight*.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(' المجله',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontWeight: FontWeight.bold,fontSize: 12),),
                            SizedBox(width: sizeConfig.screenWidth*.08,),
                            Image.asset('assets/magazine.jpg',height: 32,)
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,top: 15),
                        child: Text('اراء عملائنا من المدرسين',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold)),
                      )),
                    SizedBox(
            width: sizeConfig.screenWidth,
            height:sizeConfig.screenHeight*.2,
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.topFive.length,
            itemBuilder: (context,index){
              return Card(
                child:Container(
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: primaryColor,
                                width: 1.0,
                                style: BorderStyle.solid))
                        ),
                        onPressed: (){}, child: Text(' مشاهده'),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('مدرس',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                            Text('${snapshot.data?.topFive[index].name}',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                            Container(

                              child: RatingBar.builder(
                                initialRating:double.parse(
                                    '${snapshot.data?.topFive[index].rating}'),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  size: 6,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),

                            // Row(
                            //   children: [
                            //     Icon(Icons.star_border_outlined,color: primaryColor,),
                            //     Icon(Icons.star,color: primaryColor,),
                            //     Icon(Icons.star,color: primaryColor,),
                            //     Icon(Icons.star,color: primaryColor,),
                            //     Icon(Icons.star,color: primaryColor,)
                            //   ],
                            // ),


                          ],
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/teacher.jpg',width: 100,))
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 3,
              );
            } ),
          )

                ],
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
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
                Get.to(AddContentScreen());

              },
                child: Icon(Icons.add_circle,color: primaryColor,size: 50,)),
          ),
           BottomNavigationBarItem(
            title: Text('Profile'),
            icon: InkWell(
              onTap:(){
                Get.to(Content());
                           },
                child:  Icon(Icons.chat_bubble_outline,),
              ),
          ),
          BottomNavigationBarItem(
            title: Text('content'),
            icon: InkWell(
              onTap: (){
                Get.to(Magazine());
              },
                child:isSelected==true? Icon(Icons.content_paste,color: primaryColor,):Icon(Icons.content_paste)),
          ),
        ],
      ),
    );

  }
}
