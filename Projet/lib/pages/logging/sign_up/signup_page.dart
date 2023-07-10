import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/logging/sign_up/signup_controller.dart';
import '../log_in/login_page.dart';

class SignupPage extends StatelessWidget {
  final _controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: .0,
          leading: GestureDetector(
              onTap: (){
                Get.off(LoginPage());
              },
              child: Icon(Icons.arrow_back, color: Colors.black,)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Text("SIGN UP",
                      style: TextStyle(
                        fontSize: 45.0,
                        fontFamily: 'OstrichSans',
                      ),),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: [
                    SizedBox(width: 10.0,),
                    Text("Create a new account",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                //CustomTextFormField(text: "E-mail", hint: "Mail@gmail.com"),
                //CustomTextFormField(text: "Password", hint: "**********"),
                SizedBox(height: 40.0,),
                Form(
                  key: _controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller.emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _controller.passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _controller.signup,
                        child: Text('Sign Up'),
                      ),
                      SizedBox(height: 16.0),
                      Obx(
                            () => Text(
                          _controller.errorMessage.value,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      print("pressed");
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Adjust the radius value as desired
                        ),
                        padding: EdgeInsets.all(12)
                    ),
                    child: Text("SIGN UP",
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