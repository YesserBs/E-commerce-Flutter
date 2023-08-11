import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../objects/article.dart';

class CartController extends GetxController {
  final addedArticles = <Article>[].obs;
  final quantityList = <int>[].obs;
  var added = 1.obs;
  var total = 0.obs;


  Future<void> addToCart(Article item) async {
    if (!addedArticles.contains(item)) {
      item.added = 1;
      addedArticles.add(item);
      quantityList.add(item.added);
      print("Added articles: $addedArticles Quantity list: $quantityList");
      showSnackBar("Item added to cart", item.nom);
    }
  }

  void increaseAdded(Article item, int index)
  {
    item.added++;
    quantityList[index]++;
    added.value = item.added;
    update();
  }
  void changeAdded(int value, int index)
  {
    quantityList[index] = value;
  }

  void decreaseAdded(Article item, int index)
  {
    item.added--;
    quantityList[index]--;
    added.value = item.added;
    update();
  }

  void calculateTotal(){
    int sum = 0;
    for (int i = 0; i < addedArticles.length; i++) {
        sum = sum + addedArticles[i].prix * quantityList[i];
    }
    total.value = sum;
    update();
  }


  void showSnackBar(String title, String subtitle) {
    Get.snackbar(
      title, // Title of the snackbar
      subtitle, // Message of the snackbar
      animationDuration: Duration(milliseconds: 650),
      duration: Duration(milliseconds: 900), // Set the duration to 1 second
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
    );
  }

  void removeCartItem(Article item, int index) {
    addedArticles.remove(item);
    quantityList.removeAt(index);
    update();
  }
}
