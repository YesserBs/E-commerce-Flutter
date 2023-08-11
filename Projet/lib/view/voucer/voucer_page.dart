import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/cart/cart_controller.dart';
import 'package:myproj/view/profile/profile_controller.dart';
import 'package:myproj/view/voucer/voucer_controller.dart';
import '../../custom/cToggleButton.dart';
import '../home/home_controller.dart';
import '../profile/profile_page.dart';

class VoucerPage extends StatelessWidget {
  VoucerController VC = Get.find();
  HomeController HC = Get.find();
  ProfileController PC = Get.find();
  late ToggleButton TButton;
  var Added = ["assets/images/coupon.png", "assets/images/coupon2.png", "assets/images/coupon1.png", "assets/images/coupon.png", "assets/images/coupon2.png", "assets/images/coupon1.png", ];

  VoucerPage() {
    TButton = ToggleButton(
      leftText: 'Added',
      left: 52,
      rightText: 'Applied',
      right: 43,
      onIsLeftChanged: PC.GetIsLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Add a coupon with code"),
                      60.h.verticalSpace,
                      SearchFormField('Voucer applied successfully'),
                      60.h.verticalSpace,
                      Text("Scan with QR code"),
                      40.h.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: config.primaryColor.withOpacity(0.3), // Shadow color
                              spreadRadius: 1, // How far the shadow extends
                              blurRadius: 10, // The blur radius
                              offset: Offset(0.5, 0.5), // Offset of the shadow
                            ),
                          ],
                          //boxShadow:
                        ),
                        child: Icon(
                          Icons.qr_code_scanner_outlined,
                          size: 70,
                          color: config.primaryColor,
                        ),
                      ),
                      240.h.verticalSpace,
                      Text("Your voucers"),
                      60.h.verticalSpace,
                      TButton,
                      120.h.verticalSpace,
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                          Added.length,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 4),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: config.primaryColor.withAlpha(100), // Shadow color
                                                  spreadRadius: 1, // How much the shadow spreads
                                                  blurRadius: 2,   // The blur effect of the shadow
                                                  offset: Offset(0.5, 0.5), // Offset in x and y direction
                                                ),
                                              ],
                                            ),
                                            child: GestureDetector(
                                                onTap: (){
                                                  HC.toggleShowImage();
                                                  VC.getIndex(index);
                                                  print("here ${VC.voucerIndex.value}");
                                                },
                                                child: Image.asset(Added[index])),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Obx(() => _buildAnimatedContainer(index))
                                    ,
                                  ],
                                )
                              );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 28,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAnimatedContainer(int value) {
  CartController CC = Get.find();
  VoucerController VC = Get.find();
  HomeController HC = Get.find();
  ProfileController PC = Get.find();
  print("$value ${VC.voucerIndex.value}");
  if (VC.voucerIndex.value == value) {
    print("entered");



    return Obx(()=> Stack(
      children: [
        AnimatedContainer(
          color: config.lightPrimaryColor,
          duration: Duration(milliseconds: 0),
          width: 330,
          height: HC.showAd.value ? 130 : 0,
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 330,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Text("Introducing our exclusive coupon – a gateway to savings and satisfaction! Unlock incredible discounts with this limited-time offer. Present this coupon at checkout to enjoy unbeatable deals on your favorite products and services."),

                  80.h.verticalSpace,
                  GestureDetector(
                    onTap: (){
                      VC.toggleVoucerApplied();
                      if (VC.voucerApplied.value == true){
                        CC.showSnackBar("Voucer applied", "-75% reduction");
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: config.primaryColor.withAlpha(90), // Shadow color
                            spreadRadius: 1, // How far the shadow extends
                            blurRadius: 10, // The blur radius
                            offset: Offset(0.5, 0.5), // Offset of the shadow
                          ),
                        ],
                        //boxShadow:
                      ),
                      child: Text(
                        VC.voucerApplied.value
                        ? "Unapply"
                        : "Apply", style: TextStyle(color: config.primaryColor, fontWeight: FontWeight.bold),)
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    )
    );
  } else {
    return SizedBox.shrink(); // Return an empty widget if value is not 1
  }
}

