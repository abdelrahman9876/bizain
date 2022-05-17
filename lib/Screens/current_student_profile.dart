import 'package:e_learning/Controllers/student_controller.dart';
import 'package:e_learning/Models/current_profile_model.dart';
import 'package:e_learning/Screens/update_student_profile.dart';
import 'package:e_learning/Widgets/app_color.dart';
import 'package:e_learning/Widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStudentScreen extends StatelessWidget {
  String errorMessage="";
   UpdateStudentScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: FutureBuilder<UpdateProfileModel>(
          future: StudentController().getCurrentStudentProfile(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return HasError(errorText:errorMessage??"" ,);
            }else{
              if(snapshot.hasData){
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: AppColor.containerColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_back,color: AppColor.whiteColor,),
                                SizedBox(width: 15,),
                                Text("تعديل الصفحه الشخصيه",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Janna LT Regular'),)

                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColor.whiteColor,
                            backgroundImage: NetworkImage('${snapshot.data.image}'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${snapshot.data.name??""}"),
                            Text("الاسم")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Text("${snapshot.data.occupation??""}"),
                            Text("الوظيفه")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Text("${snapshot.data.bio??""}"),
                            Text("السيره الذاتيه")
                          ],
                        )
                      ],
                    ),
                    RaisedButton(onPressed: (){
                      Get.to(UpdateProfile(
                        image: snapshot.data.image,
                        name: snapshot.data.name,
                        occupation: snapshot.data.occupation,
                        bio: snapshot.data.bio,
                      ));
                    }, child: Text("تعديل الملف الشخصي"))

                  ],
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
          },
        )
      ),
    );
  }
}
