import 'package:flutter/material.dart';
import 'package:myproj/config/configuration.dart';

class cText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool changeFont;

  const cText({
    Key? key,
    required this.text,
    this.style = const TextStyle(fontSize: config.FontSizeNormal),
    this.changeFont = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle updatedStyle = changeFont
        ? style.copyWith(fontFamily: 'OstrichSans')
        : style;

    return Text(
      text,
      style: updatedStyle,
    );
  }
}
