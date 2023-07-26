import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../objects/article.dart';

class CartController extends GetxController {
  final addedArticles = <Article>[].obs;

  Future<void> addToCart(Article item) async {
    if (!addedArticles.contains(item)) {
      addedArticles.add(item);
      print("Added articles: $addedArticles");
      showSnackBar(item.nom);
    } else {
      print("Item already in cart");
    }
  }

  void showSnackBar(String name) {
    Get.snackbar(
      'Item added to Cart', // Title of the snackbar
      name, // Message of the snackbar
      animationDuration: Duration(milliseconds: 700),
      duration: Duration(milliseconds: 1200), // Set the duration to 1 second (adjust as needed)
      snackPosition: SnackPosition.TOP, // Show the snackbar from the top
      // You can add more options for the snackbar here if needed
    );
  }

  void removeCartItem(Article item) {
    addedArticles.remove(item);
  }
}
