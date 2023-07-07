

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../custom/custom_textForm.dart';

class LoginPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 5.0,),
                        Text("Welcome",
                          style: TextStyle(
                            fontSize: 45.0,
                            fontFamily: 'OstrichSans',
                          ),),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        //Get.to(ConnexionScreen());
                      },
                      child: Text("Sign up?",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18.0,
                        ),),
                    ),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: [
                    SizedBox(width: 15.0,),
                    Text("Log in to continue",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.0,),
                CustomTextFormField(hint: "My user name", text: "User name"),
                CustomTextFormField(hint: "**********", text: "Password"),
                Container(
                    margin: EdgeInsets.fromLTRB(0.0, 40.0, 40.0, 0.0),
                    alignment: Alignment.topRight,
                    child: Text("-Forgot password?-",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[700]
                      ),
                    )
                ),
                SizedBox(height: 25.0,),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      //Get.to(HomeScreen());
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Adjust the radius value as desired
                        ),
                        padding: EdgeInsets.all(12)
                    ),
                    child: Text("LOG IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,

                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}