import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxInt Quantity = 0.obs;
  List<Map<String, dynamic>> addedItems = <Map<String, dynamic>>[
  ].obs;


  void addItem(Map<String, dynamic> selectedItem) {
    addedItems.add(selectedItem);
    print(addedItems);
    update();
  }

  void increment(int index){
    addedItems[index]['added']++;
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
