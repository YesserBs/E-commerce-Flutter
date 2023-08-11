import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproj/config/configuration.dart';

class ToggleButton extends StatefulWidget {
  final String leftText;
  final String rightText;
  final double right;
  final double left;
  final double top;
  final Function(bool) onIsLeftChanged;


  ToggleButton({this.leftText = "Left", this.rightText = "Right",
    this.right = 55, this.left = 55, this.top = 10, required this.onIsLeftChanged});

  @override
  _ToggleButton createState() => _ToggleButton();
}
class _ToggleButton extends State<ToggleButton> {
  bool _isLeft = false;

  void _togglePosition() {
    setState(() {
      _isLeft = !_isLeft;
      widget.onIsLeftChanged(_isLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => _togglePosition(),
          child: Container(
            height: 39,
            width: 280,
            decoration: BoxDecoration(
              color: config.lightPrimaryColor,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
        AnimatedPositioned(
          top: 2,
          duration: Duration(milliseconds: 450),
          curve: Curves.easeInOut,
          left: _isLeft ? 2.0 : 140.0,
          child: GestureDetector(
            onTap: _togglePosition,
            child: Container(
              width: 140,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: config.lightPrimaryColor, // Shadow color
                    spreadRadius: 0.1, // How much the shadow spreads
                    blurRadius: 4,   // The blur effect of the shadow
                    offset: Offset(0.5, 0.5), // Offset in x and y direction
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: widget.top,
          left: widget.left,
          child: GestureDetector(
            onTap: () => _togglePosition(),
            child: Text(
              widget.leftText,
              style: TextStyle(
                color: !_isLeft ? Colors.grey[500] : Colors.grey[600],
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Positioned(
          top: widget.top,
          right: widget.right,
          child: GestureDetector(
            onTap: () => _togglePosition(),
            child: Text(
              widget.rightText,
              style: TextStyle(
                color: _isLeft ? Colors.grey[500] : Colors.grey[600],
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}