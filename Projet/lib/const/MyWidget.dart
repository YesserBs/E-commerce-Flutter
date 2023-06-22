import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool indent;
  final String? image;

  const CustomWidget({
    Key? key,
    required this.text,
    this.style = const TextStyle(),
    this.indent = false,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (indent) SizedBox(width: 30),
          if (image != null)
            SizedBox(
              width: 30,
              child: Image.asset(image!),
            ),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }
}
