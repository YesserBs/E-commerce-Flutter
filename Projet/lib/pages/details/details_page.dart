import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/pages/details/details_controller.dart';

import '../cart/cart_controller.dart';


class DetailsPage extends StatelessWidget {
  DetailsController DC = Get.find();
  CartController CC = Get.find();

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


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(DC.selectedItem['nom'],
                              style: TextStyle(fontSize: 35.0,
                                  fontFamily: 'OstrichSans',
                                  color: Colors.grey[800]),textAlign: TextAlign.center),
                          Text("${DC.selectedItem['prix'].toString()} dts",
                              style: TextStyle(fontSize: 20.0,
                                  fontFamily: 'OstrichSans',
                                  color: Colors.grey[500]),textAlign: TextAlign.center),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
                              child: Image.asset(DC.selectedItem['image'])),
                          const Text("Introducing this new iPhone: a technological marvel that pushes the boundaries of innovation. With its stunning edge-to-edge OLED display, every image and video comes to life with incredible clarity and vibrant colors. Powered by the lightning-fast A14 Bionic chip, it effortlessly handles multitasking and demanding apps. The triple-camera system lets you capture professional-grade photos and videos, while the advanced Face ID ensures secure and convenient unlocking. The iPhone Pro X also offers 5G connectivity for lightning-fast browsing and downloads. Experience the pinnacle of performance and luxury with the iPhone Pro X.",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CC.addItem(DC.selectedItem.value);
                      DC.updateButton();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60.0),
                      shape: ContinuousRectangleBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                        SizedBox(width: 10.0),
                        Obx(() => Text(
                          DC.txt.value,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
