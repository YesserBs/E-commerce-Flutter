import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = Get.arguments as String; // Retrieve the passed argument

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
                    Icon(
                      Icons.chevron_left,
                      color: Colors.grey[900],
                      size: 35.0,
                    ), // Icon on the left
                  ],
                ),
              ),
            ),
            Center(
              child: Text("Details"),
            ),
            SizedBox(height: 30.0,),
            Center(child: Text("Name: $name",
            style: TextStyle(fontSize:  30.0),)), // Display the name
          ],
        ),
      ),
    );
  }
}
