import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/cart/cart_controller.dart';

class DetailsController extends GetxController {
  CartController CC = Get.find();
  RxString txt = "Add to cart".obs;
  final Rx<IconData> icn = Icons.add.obs;
  RxMap<String, dynamic> selectedItem = RxMap<String, dynamic>();

  void GetItem(Map<String, dynamic> value){
    selectedItem.value = value;
    changeButton();
    update();
  }

  void changeButton(){
    if (selectedItem["added"] > 0){
      txt.value = "Added";
      icn.value = Icons.done;
    }
    else{
      txt.value = "Add to cart";
      icn.value = Icons.add;
    }
    update();
  }
}
