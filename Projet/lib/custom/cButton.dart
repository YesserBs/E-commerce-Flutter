import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproj/config/configuration.dart';

class cButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const cButton({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = (config.FontSizeNormal-10).sp;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        primary: config.backgroundColor,
        elevation: 0.0.sp,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Row(
              children: [
                Icon(
                  icon,
                  color: config.secondaryColor,
                  size: size+5,
                ),
                SizedBox(width: 10.0),
              ],
            ),
          Text(
            text,
            style: TextStyle(color: config.secondaryColor,
            fontSize: size),
          ),
        ],
      ),
    );
  }
}
