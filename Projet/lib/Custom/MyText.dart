import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  MyText({this.text = 'Title', this.fontSize = 18.0, this.color = Colors.black});


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        )

      ),
    );
  }
}
