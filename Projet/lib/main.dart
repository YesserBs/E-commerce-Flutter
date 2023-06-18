import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/screens/login.dart';
import 'package:myproj/screens/connexion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginScreen()
    );
  }
}
