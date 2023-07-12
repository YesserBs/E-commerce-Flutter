import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import 'package:myproj/custom/cTextFormField.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: config.backgroundColor,
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
                        cText(text: "Welcome", changeFont: true,
                        size: config.FontSizeBigTitle,),
                        SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        //Get.to(SignupForm());
                      },
                      child: cText(
                        text: "Sign up?",
                        size: config.FontSizeNormal,
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
                      width: 10.0,
                    ),
                    cText(text: "Log in to continue",
                      style: TextStyle(
                        fontSize: config.FontSizeSmall,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                Form(
                  key: _controller.LoginformKey,
                  child: Column(
                    children: [
                      cTextFormField(controller: _controller.emailController,
                          labelText: "email"),
                      SizedBox(height: 16.0,),
                      cTextFormField(controller: _controller.passwordController,
                          labelText: "password",
                          obscureText: true),                      SizedBox(height: 16.0),
                      Obx(
                            () => Text(
                          _controller.errorMessage.value,
                          style: TextStyle(color: config.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 30.0, 40.0, 0.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    "-Forgot password?-",
                    style: TextStyle(
                      fontSize: 14.0,
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
                      _controller.login();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: config.primaryColor,
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
                SizedBox(height: 30.0),
                Center(child: cText(text: "-OR-")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 40.0,
                        child: Image.asset('assets/images/login/google.webp')),
                    SizedBox(width: 20.0,),
                    cText(text: "Log in with google", size: config.FontSizeNormal, style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 40.0,
                        child: Image.asset('assets/images/login/facebook.png')),
                    SizedBox(width: 20.0,),
                    cText(text: "Log in with facebook", size: config.FontSizeNormal, style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
