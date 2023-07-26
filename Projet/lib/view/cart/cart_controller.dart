import 'package:cloud_firestore/cloud_firestore.dart';
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

  void decreaseAdded(Article item)
  {
    item.added--;
    added.value = item.added;
    update();
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

  void removeCartItem(Article item, int index) {
    addedArticles.remove(item);
    quantityList.removeAt(index);
    update();
  }
}
