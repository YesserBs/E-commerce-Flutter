import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproj/custom/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController controller; // Add the TextEditingController parameter

  CustomTextFormField({
    this.text = '',
    this.hint = '',
    required this.controller, // Assign the TextEditingController parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.0,),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: MyText(text: text),
          ),
          TextFormField(
            controller: controller, // Assign the TextEditingController to the TextFormField
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
