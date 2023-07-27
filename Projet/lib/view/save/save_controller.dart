import 'package:cloud_firestore/cloud_firestore.dart';
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
      animationDuration: Duration(milliseconds: 700),
      duration: Duration(milliseconds: 1200), // Set the duration to 1 second (adjust as needed)
      snackPosition: SnackPosition.TOP, // Show the snackbar from the top
      // You can add more options for the snackbar here if needed
    );
  }

  void removeCartItem(Article item) {
    SavedArticles.remove(item);
  }
}