import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxInt Quantity = 1.obs;
  RxInt TheIndex = 0.obs;
  List<Map<String, dynamic>> addedItems = <Map<String, dynamic>>[
  ].obs;

  void addItem(Map<String, dynamic> selectedItem) {
    if (selectedItem['added'] == 0){
      selectedItem['added'] = 1;
      addedItems.add(selectedItem);
      update();
    }
    else{
      deleteItem(selectedItem);
    }
  }

  void increment(int index){
    TheIndex.value = index;
    addedItems[index]['added']++;
    Quantity.value = addedItems[index]['added'];
    update();
  }
  void decrement(int index){
    TheIndex.value = index;
    print(index);
    print(addedItems[index]['added']);
    if (addedItems[index]['added'] > 1) {
      addedItems[index]['added']--;
      Quantity.value = addedItems[index]['added'];
    }
    else{
      Quantity.value = addedItems[index]['added'];
    }
    update();
  }
  void changeValue(int index, int value){
    TheIndex.value = index;
    addedItems[index]['added'] = value;
    Quantity.value = addedItems[index]['added'];
    update();
  }

  String TheText(int index) {
    if (index == TheIndex.value && index < addedItems.length) {
      return Quantity.value.toString();
    } else if (index < addedItems.length) {
      return addedItems[index]['added'].toString();
    } else {
      return ''; // Ou renvoyer un texte par défaut approprié
    }
  }


  void deleteItem(Map<String, dynamic> item){
    item['added'] = 0;
    //int x = item['id'];
    //print(x);
    addedItems.removeWhere((map) => map['id'] == item['id']);
    print(addedItems);
  }
}
