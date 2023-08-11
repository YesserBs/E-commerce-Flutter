import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLeft = false.obs;
  var searchedText = '';

  void GetIsLeft(bool value){
    isLeft.value = value;
    update();
  }

  void getSearchText(String value){
    searchedText = value;
  }

  void showSnackBar(String message, String value) {
    Get.snackbar(
      message, // Title of the snackbar
      value, // Message of the snackbar
      animationDuration: Duration(milliseconds: 650),
      duration: Duration(milliseconds: 900), // Set the duration to 1 second
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
    );
  }

}
