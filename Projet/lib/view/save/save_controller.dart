import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../objects/article.dart';

class SaveController extends GetxController {
  final SavedArticles = <Article>[].obs;

  Future<void> addToSave(Article item) async {
    if (!SavedArticles.contains(item)) {
      SavedArticles.add(item);
      print("Added articles: $SavedArticles");
      showSnackBar(item.nom);
    } else {
      print("Item already in cart");
    }
  }

  void showSnackBar(String name) {
    Get.snackbar(
      'Item saved', // Title of the snackbar
      name, // Message of the snackbar
      animationDuration: Duration(milliseconds: 650),
      duration: Duration(milliseconds: 900), // Set the duration to 1 second (adjust as needed)
      snackPosition: SnackPosition.BOTTOM, // Show the snackbar from the top
      margin: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
      // You can add more options for the snackbar here if needed
    );
  }

  void removeCartItem(Article item) {
    SavedArticles.remove(item);
  }
}
