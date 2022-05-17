import 'package:e_learning/Controllers/student_controller.dart';
import 'package:e_learning/Models/current_profile_model.dart';
import 'package:e_learning/Widgets/app_color.dart';
import 'package:e_learning/Widgets/custom_text_field.dart';
import 'package:e_learning/Widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  final String name;
  final String image;
  final String occupation;
  final String bio;
  String errorMessage="";
   UpdateProfile({Key key, this.name, this.image, this.occupation, this.bio}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<UpdateProfileModel>(
            future: StudentController().getCurrentStudentProfile(),
            builder: (context,snapshot){
              if(snapshot.hasError){
                return HasError(errorText:errorMessage??"" ,);
              }else{
                if(snapshot.hasData){
                  return SingleChildScrollView(
                    child: Column(
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
                         CustomTextField(
                           initialValue: snapshot.data.name,
                         ),
                            CustomTextField(
                              initialValue: snapshot.data.occupation,
                            ),
                            CustomTextField(
                              initialValue: snapshot.data.bio,
                            )
                          ],
                        ),
                        RaisedButton(onPressed: (){
                            StudentController().updateStudentProfile(
                              name: name,
                              occupation: occupation,
                              bio: bio,
                              image: image
                            );
                        }, child: Text("تعديل الملف الشخصي"))

                      ],
                    ),
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
