import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/home/home_controller.dart';

class AccountPage extends StatelessWidget {
  HomeController HC = Get.find<HomeController>(); // Retrieve the existing instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Cart")
      ),
    );
  }
}
