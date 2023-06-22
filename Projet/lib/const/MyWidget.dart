import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool indent;

  const CustomWidget({
    Key? key,
    required this.text,
    this.style = const TextStyle(),
    this.indent = false, // New boolean parameter with default value
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
          if (indent) SizedBox(width: 30), // Show SizedBox if indent is true
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }
}
