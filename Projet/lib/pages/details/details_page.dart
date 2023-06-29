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
                    child: Center(
                      child: Text(DC.selectedItem['nom'],
                        style: TextStyle(
                          fontSize: 30,
                        ),),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CC.addItem(DC.selectedItem.value);
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
                        Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 30,
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
