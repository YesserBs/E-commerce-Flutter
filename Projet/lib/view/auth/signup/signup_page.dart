import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import 'package:myproj/custom/cTextFormField.dart';
import 'package:myproj/view/auth/signup/signup_controller.dart';

class SignupPage extends StatelessWidget {
  SignupController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: config.backgroundColor, elevation: 0.0,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: config.secondaryColor,)),),
      backgroundColor: config.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 60.w, right: 60.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                100.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        cText(text: "Sign up", changeFont: true,
                          size: config.FontSizeBigTitle,),
                        50.h.verticalSpace
                      ],
                    ),
                  ],
                ),
                10.h.verticalSpace,
                Row(
                  children: [
                    20.w.horizontalSpace,
                    cText(text: "create new account", size: config.FontSizeSmall,),
                  ],
                ),
                500.h.verticalSpace,
                Form(
                  key: _controller.SignupformKey,
                  child: Column(
                    children: [
                      cTextFormField(controller: _controller.usernameController,
                          labelText: "User name"),
                      250.h.verticalSpace,
                      cTextFormField(controller: _controller.emailController,
                          labelText: "email"),
                      250.h.verticalSpace,
                      cTextFormField(controller: _controller.passwordController,
                          labelText: "password",
                          obscureText: true),
                      250.h.verticalSpace,
                      Obx(
                            () => Text(
                          _controller.errorMessage.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: config.FontSizeSmall.sp),
                        ),
                      ),
                      100.h.verticalSpace,
                    ],
                  ),
                ),
                150.h.verticalSpace,
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: config.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.h), // Adjust the radius value as desired
                      ),
                      padding: EdgeInsets.all(40.h),
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0.sp,
                      ),
                    ),
                  ),
                ),
                400.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
