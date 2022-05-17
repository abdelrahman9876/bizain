// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:e_learning/Controllers/content_controller.dart';
import 'package:e_learning/Controllers/teacher_controller.dart';
import 'package:e_learning/Models/magazine_model.dart';
import 'package:e_learning/Screens/teacher_profile.dart';
import 'package:e_learning/Screens/upload.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'content_screen.dart';

class Magazine extends StatefulWidget {

  Magazine({Key key}) : super(key: key);

  @override
  State<Magazine> createState() => _MagazineState();
}

class _MagazineState extends State<Magazine> {
  SizeConfig sizeConfig = SizeConfig();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  bool isSelected;

  final TeacherController controller = Get.put(TeacherController());

  int pages = 0;

  int currentPage = 0;

  bool isReady = false;

  String errorMessage = '';

  PdfViewerController _pdfViewerController;
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.previousPage();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.nextPage();
            },
          )
        ],
        title: Text('المجله',
            style: TextStyle(
                color: accentColor,
                fontFamily: 'Janna LT Regular',
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        leading: Icon(
          Icons.arrow_back,
          color: accentColor,
        ),
        backgroundColor: buttonTextColor,
      ),
      body: FutureBuilder<MagazineResponseModel>(
        future: ContentController().getMagazine(),
        builder: (context, snapshot) {
              if(snapshot.hasData){

                return Container(
                  child:SfPdfViewer.network(
                    'https://bayazin.earndawn.xyz/uploads/magazines/aOqirmC5MB9SZDFVgfWpjYVmf0bE4yrBylI71RMLlgFPuBraFOjZ5YKOsoJsY3rpC8HAbDewReNkLAQ8Tt9VLi6SvehwoaXRUCeO/DT0fvAPViTBYmBofbMBjoBew1Ma1WcNmNDJrtD4ESDqsDHoiPcAKVEDEQq6AYXRzowTcvoqC7GifV6g8yBuLbGYiDFPuE3nohQ2Y.pdf',
                    controller: _pdfViewerController,
                    key: _pdfViewerKey,
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
