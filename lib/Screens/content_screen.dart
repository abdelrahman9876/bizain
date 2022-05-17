import 'package:e_learning/Controllers/content_controller.dart';
import 'package:e_learning/Controllers/teacher_controller.dart';
import 'package:e_learning/Models/content_model.dart';
import 'package:e_learning/Widgets/vedio_item.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class Content extends StatefulWidget {

   Content({Key key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  SizeConfig sizeConfig=SizeConfig();

  bool isSelected;

  final ContentController controller=Get.put(ContentController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('المحتوي',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold)),
        leading: Icon(Icons.arrow_back,color: accentColor,),
        backgroundColor: buttonTextColor,
      ),
      body: FutureBuilder<ContentResponseModel>(
        future:controller.getVideos() ,
        builder: (context,snapshot){


                 if(snapshot.hasData){
                   return ListView.builder(
                     itemCount: snapshot.data?.videos.length,
                       itemBuilder: (context,index){

                     return Container(
                       height: 200,
                       child: VideoItems(
                         videoPlayerController:
                         VideoPlayerController
                             .network(
                             '${snapshot.data?.videos[index]}'),
                         looping: true,
                         autoplay: false, width:sizeConfig.screenWidth, fit: BoxFit.cover,
                       ),
                     );
                   });
                 }else{
                   return Center(child: CircularProgressIndicator());
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
            icon: Icon(Icons.group_add),
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

                  Get.to(Content());
                },
                child:isSelected==true? Icon(Icons.content_paste,color: primaryColor,):Icon(Icons.content_paste)),
          ),
        ],
      ),

    );
  }
}
