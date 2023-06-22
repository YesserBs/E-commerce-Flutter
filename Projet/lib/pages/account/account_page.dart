import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/home/home_controller.dart';

class AccountPage extends StatelessWidget {
  HomeController HC = Get.find<HomeController>(); // Retrieve the existing instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[200], // Set button color to red
          ),
          onPressed: () {
            HC.addItem();
          },
          icon: Icon(Icons.add, color: Colors.black),
          label: Text(
            'Add',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
