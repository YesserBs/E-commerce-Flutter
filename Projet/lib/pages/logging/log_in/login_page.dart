import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/logging/log_in/login_controller.dart';
import 'package:myproj/pages/logging/sign_up/signup_page.dart';

import '../../../custom/custom_textForm.dart';

class LoginPage extends StatelessWidget {
  final LoginController LC = Get.find(); // Use Get.put to initialize the LoginController

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
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 45.0,
                            fontFamily: 'OstrichSans',
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupPage());
                      },
                      child: Text(
                        "Sign up?",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Log in to continue",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                CustomTextFormField(
                  hint: "My e-mail",
                  text: "User name",
                  controller: LC.emailController, // Assign controller to capture text
                ),
                CustomTextFormField(
                  hint: "**********",
                  text: "Password",
                  controller: LC.passwordController, // Assign controller to capture text
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 40.0, 40.0, 0.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    "-Forgot password?-",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      String email = LC.emailController.text; // Retrieve text from email controller
                      String password = LC.passwordController.text; // Retrieve text from password controller
                      print("Email: $email, Password: $password"); // Print the entered texts
                      //LC.login(); // Call the login method in LoginController
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius value as desired
                      ),
                      padding: EdgeInsets.all(12),
                    ),
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Get.to(SignupPage());
                  },
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
