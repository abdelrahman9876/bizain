import 'package:e_learning/constants.dart';
import 'package:e_learning/helpers/size_config.dart';
import 'package:flutter/material.dart';

class Invitation  extends StatelessWidget {
  SizeConfig sizeConfig=SizeConfig();
  bool isSelected;
  Invitation({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('دعوة مؤثرين',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 18,fontWeight: FontWeight.bold)),
        leading: Icon(Icons.arrow_back,color: accentColor,),
        backgroundColor: buttonTextColor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: sizeConfig.screenWidth*.1,top: sizeConfig.screenHeight*.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.group_add),
                Column(
                  children: [
                    Text('سهيله احمد',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                    Text('مدرس فيزياء ',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/teacher.jpg'),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: sizeConfig.screenWidth*.1,top: sizeConfig.screenHeight*.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.group_add),
                Column(
                  children: [
                    Text('سهيله احمد',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                    Text('مدرس فيزياء ',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/teacher.jpg'),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: sizeConfig.screenWidth*.1,top: sizeConfig.screenHeight*.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.group_add),
                Column(
                  children: [
                    Text('سهيله احمد',style: TextStyle(color: primaryColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                    Text('مدرس فيزياء ',style: TextStyle(color: accentColor,fontFamily: 'Janna LT Regular',fontSize: 13,fontWeight: FontWeight.bold)),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/teacher.jpg'),
                )
              ],
            ),
          ),


        ],
      ),
      bottomNavigationBar:BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        fixedColor:primaryColor,
        showSelectedLabels:false,
        showUnselectedLabels:false,
        // currentIndex: snapshot.data.index,
        //  onTap: _bottomNavBarBloc.pickItem,
        items:[
          const BottomNavigationBarItem(
            title:Text('Search'),
            icon:Icon(Icons.home),
          ),
          const BottomNavigationBarItem(
            title:Text('Browse'),
            icon:Icon(Icons.group_add),
          ),
          const BottomNavigationBarItem(
            title:Text('Favorites'),
            icon:Icon(Icons.add_circle,color: primaryColor,size: 50,),
          ),
          const BottomNavigationBarItem(
            title:Text('Favorites'),
            icon:Icon(Icons.chat_bubble_outline,),
          ),
          BottomNavigationBarItem(
            title:const Text('content'),
            icon:InkWell(
                onTap:(){
                  //  Get.to(Content());
                },
                child:isSelected==true?const Icon(Icons.content_paste,color: primaryColor,):Icon(Icons.content_paste)),
          ),
        ],
      ),

    );

  }
}
