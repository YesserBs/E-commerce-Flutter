import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../account/account_controller.dart';

class DetailsPage extends StatelessWidget {

  AccountController AC = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    final String name = Get.arguments as String;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
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
                      Icon(
                        Icons.chevron_left,
                        color: Colors.grey[900],
                        size: 35.0,
                      ), // Icon on the left
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    //color: Colors.green,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  print(name);
                  AC.NewItem(name);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.plus, color: Colors.white,),
                        SizedBox(width: 10.0,),
                        Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
