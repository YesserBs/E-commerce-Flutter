import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Text("Home Page",
              style: TextStyle(fontSize: 25.0, fontFamily: 'OstrichSans'),),
          ),
        ),
      ),
    );
  }
}
