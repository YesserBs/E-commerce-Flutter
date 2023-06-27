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


            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(DC.selectedItem['nom'],
                      style: TextStyle(
                        fontSize: 30,
                      ),),
                  ),
                  ElevatedButton(onPressed: (){
                    print(DC.selectedItem.value);
                    CC.addItem(DC.selectedItem.value);
                  },
                  child: Text("Change",
                    style: TextStyle(
                    fontSize: 30,
                  ),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
