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

  void addItem(Map<String, dynamic> selectedItem) {
    if (selectedItem['added'] == 0){
      selectedItem['added'] = 1;
      addedItems.add(selectedItem);
      sum();
      update();
    }
    else{
      deleteItem(selectedItem);
    }
  }

  void increment(int index){
    if (index < addedItems.length){
    TheIndex.value = index;
    addedItems[index]['added']++;
    Quantity.value = addedItems[index]['added'];
    sum();
    update();}
  }
  void decrement(int index){
    TheIndex.value = index;
    if (index < addedItems.length){
    if (addedItems[index]['added'] > 1) {
      addedItems[index]['added']--;
      Quantity.value = addedItems[index]['added'];
    }
    else{
      Quantity.value = addedItems[index]['added'];
    }
    sum();
    update();
  }}
  void changeValue(int index, int value){
    if (index < addedItems.length){
      TheIndex.value = index;
      addedItems[index]['added'] = value;
      Quantity.value = addedItems[index]['added'];
      sum();
      update();
    }
  }

  String TheText(int index) {
    if (index == TheIndex.value && index < addedItems.length) {
      return Quantity.value.toString();
    } else if (index < addedItems.length) {
      return addedItems[index]['added'].toString();
    } else {
      return '0'; // Ou renvoyer un texte par défaut approprié
    }
  }

  void deleteItem(Map<String, dynamic> item){
    item['added'] = 0;
    addedItems.removeWhere((map) => map['id'] == item['id']);
    print(addedItems);
    sum();
    update();
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
}