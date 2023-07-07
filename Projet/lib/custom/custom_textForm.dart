import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproj/custom/custom_text.dart';



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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.0,),
          Padding(padding: EdgeInsets.only(left: 5.0),
              child: MyText(text: text)),
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