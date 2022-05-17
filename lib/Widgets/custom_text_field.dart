import 'package:e_learning/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onSubmitted;
  final Function validator;
  final String initialValue;
  const CustomTextField({Key key, this.hintText, this.controller, this.onSubmitted, this.validator, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
    child: Card(
        elevation: 4,
        child: TextFormField(
          initialValue: initialValue,
          controller: controller,
          cursorColor: Colors.grey,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: hintText,hintStyle: const TextStyle(color: textColor,fontFamily: 'Janna LT Regular',),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(0)
              )
          ),
        ),
      ),
    );
  }
}
