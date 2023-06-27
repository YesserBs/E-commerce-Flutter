import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxInt Quantity = 0.obs;
  List<Map<String, dynamic>> addedItems = <Map<String, dynamic>>[
    {
      'nom': 'iPhone SE',
      'image': 'assets/images/IPH5.webp',
      'marque': 'Apple',
      'prix': 499,
      'added': 0
    },
  ].obs;


  void increment(int index){
    addedItems[index]['added']++;
    Quantity.value = addedItems[index]['added'];
    update();
  }
  void decrement(int index){
    if (addedItems[index]['added'] > 1) {
      addedItems[index]['added']--;
      Quantity.value = addedItems[index]['added'];
      update();
    }
  }
}
