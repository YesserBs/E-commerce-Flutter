

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/pages/dashboard/dashboard_page.dart';
import 'package:myproj/pages/home/home_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 150, // Specify the desired width
                height: 50, // Specify the desired height
                color: Colors.transparent, // Customize the button color
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.0,),
                    Icon(Icons.chevron_left, color: Colors.grey[900],
                    size: 35.0,), // Icon on the left
                  ],
                ),
              ),
            ),


            Center(
              child: Text("Details screen"),
            ),
          ],
        ),
      ),
    );
  }
}
