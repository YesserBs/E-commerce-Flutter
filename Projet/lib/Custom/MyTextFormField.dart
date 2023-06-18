import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproj/Custom/MyText.dart';



class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;


  CustomTextFormField({
    this.text = '',
    this.hint = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40.0,),
          MyText(text: text,),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[500],
              ),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}