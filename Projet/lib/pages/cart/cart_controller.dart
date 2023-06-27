import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxInt Quantity = 0.obs;

  void ChangeQuantity(int value) {
    Quantity.value = value;
    update();
  }
  void increment(){
    Quantity.value++;
    update();
  }
  void decrement(){
    if (Quantity.value > 1){
      Quantity.value--;
      update();
    }
  }
}
