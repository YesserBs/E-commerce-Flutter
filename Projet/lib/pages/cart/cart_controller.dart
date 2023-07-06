import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxInt Quantity = 1.obs;
  RxInt TheIndex = 0.obs;
  RxInt Total = 0.obs;
  List<Map<String, dynamic>> addedItems = <Map<String, dynamic>>[
  ].obs;
  RxMap<String, dynamic> swipedItem = RxMap<String, dynamic>();


  void addItem(Map<String, dynamic> selectedItem) {
    if (selectedItem['added'] == 0){
      selectedItem['added'] = 1;
      addedItems.add(selectedItem);
      sum();
      update();
    }
  }

  void increment(int index){
    TheIndex.value = index;
    addedItems[index]['added']++;
    Quantity.value = addedItems[index]['added'];
    sum();
    update();
  }
  void decrement(int index){
    TheIndex.value = index;
    print(index);
    print(addedItems[index]['added']);
    if (addedItems[index]['added'] > 1) {
      print("ENTERED!");
      addedItems[index]['added']--;
      Quantity.value = addedItems[index]['added'];
    }
    else{
      Quantity.value = addedItems[index]['added'];
    }
    sum();
    update();
  }
  void changeValue(int index, int value){
    TheIndex.value = index;
    addedItems[index]['added'] = value;
    Quantity.value = addedItems[index]['added'];
    sum();
    update();
  }

  String TheText(int index){
    if (index == TheIndex.value){
      return Quantity.value.toString();
    }
    else{
      return addedItems[index]['added'].toString();
    }
  }

  void sum() {
    var totalPrice = 0;

    for (var item in addedItems) {
      final added = item['added'] as int?;
      final prix = item['prix'] as int?;

      if (added != null && prix != null) {
        totalPrice += added * prix;
      }
    }
    Total.value = totalPrice;
    print('Total Price: $totalPrice');
  }

  void swipeItem(int index) {
    swipedItem.value = addedItems[index];
    print(addedItems);
    update();
  }

  void removeItem(int index) {
    addedItems[index]['added'] = 0;
    addedItems.removeAt(index);
    print(addedItems);
    sum();
    update();
  }

}
