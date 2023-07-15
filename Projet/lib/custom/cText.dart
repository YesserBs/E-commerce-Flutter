import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproj/config/configuration.dart';

class cText extends StatelessWidget {
  final String text;
  final double size;
  // Changing style should be avoided since its a custom button
  final TextStyle style;
  final bool changeFont;

  const cText({
    Key? key,
    required this.text,
    this.size = config.FontSizeNormal,
    this.style = const TextStyle(),
    this.changeFont = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle updatedStyle = changeFont
        ? style.copyWith(fontFamily: 'OstrichSans', fontSize: size.sp, color: config.secondaryColor)
        : style.copyWith(fontSize: size.sp, color: config.secondaryColor);

    return Text(
      text,
      style: updatedStyle,
    );
  }
}
