import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../objects/article.dart';

class CartController extends GetxController {
  final addedArticles = <Article>[].obs;
  final quantityList = <int>[].obs;
  var added = 1.obs;


  Future<void> addToCart(Article item) async {
    if (!addedArticles.contains(item)) {
      item.added = 1;
      addedArticles.add(item);
      quantityList.add(item.added);
      print("Added articles: $addedArticles Quantity list: $quantityList");
      showSnackBar(item.nom);
    } else {
      print("Item already in cart");
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


  void showSnackBar(String name) {
    Get.snackbar(
      'Item added to Cart', // Title of the snackbar
      name, // Message of the snackbar
      animationDuration: Duration(milliseconds: 650),
      duration: Duration(milliseconds: 900), // Set the duration to 1 second (adjust as needed)
      snackPosition: SnackPosition.BOTTOM, // Show the snackbar from the top
      margin: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
      // You can add more options for the snackbar here if needed
    );
  }

  void removeCartItem(Article item, int index) {
    addedArticles.remove(item);
    quantityList.removeAt(index);
    update();
  }
}
