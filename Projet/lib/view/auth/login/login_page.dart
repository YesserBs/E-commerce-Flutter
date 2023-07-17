import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import 'package:myproj/custom/cTextFormField.dart';
import 'package:myproj/view/auth/signup/signup_page.dart';
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
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 60.w),
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
                        cText(text: "Welcome", changeFont: true,
                        size: config.FontSizeBigTitle,),
                        50.h.verticalSpace
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupPage());
                      },
                      child: cText(
                        text: "Sign up?",
                      ),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                Row(
                  children: [
                    150.w.horizontalSpace,
                    cText(text: "Log in to continue", size: config.FontSizeSmall,),
                  ],
                ),
                500.h.verticalSpace,
                Form(
                  key: _controller.LoginformKey,
                  child: Column(
                    children: [
                      cTextFormField(controller: _controller.emailController,
                          labelText: "email"),
                      250.h.verticalSpace,
                      cTextFormField(controller: _controller.passwordController,
                          labelText: "password",
                          obscureText: true),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0.w, 60.0.h, 20.0.w, 45.0.h),
                        alignment: Alignment.topRight,
                        child: Text(
                          "-Forgot password?-",
                          style: TextStyle(
                            fontSize: 40.0.sp,
                          ),
                        ),
                      ),
                      150.h.verticalSpace,
                      Obx(
                            () => Text(
                          _controller.errorMessage.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: config.FontSizeSmall.sp),
                        ),
                      ),
                      50.h.verticalSpace,
                    ],
                  ),
                ),
                150.h.verticalSpace,
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      _controller.login();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: config.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.h), // Adjust the radius value as desired
                      ),
                      padding: EdgeInsets.all(40.h),
                    ),
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0.sp,
                      ),
                    ),
                  ),
                ),
                220.h.verticalSpace,
                Center(child: cText(text: "-OR-", size: config.FontSizeSmall,)),
                190.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 120.0.h,
                        child: Image.asset('assets/images/google.webp')),
                    110.w.horizontalSpace,
                    Text("Log in with Google", style: TextStyle(fontWeight: FontWeight.bold, fontSize: config.FontSizeNormal.sp),)
                  ],
                ),
                220.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 120.0.h,
                        child: Image.asset('assets/images/facebook.png'),),
                    110.w.horizontalSpace,
                    Text("Log in with Facebook", style: TextStyle(fontWeight: FontWeight.bold, fontSize: config.FontSizeNormal.sp),)
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
