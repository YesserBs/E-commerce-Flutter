import 'package:get/get.dart';

import '../../objects/article.dart';

class CartController extends GetxController {
  final addedArticles = <String>[].obs;

  void addUidToCart(String name, String uid) {
    if (!addedArticles.contains(uid)) {
      addedArticles.add(uid);
      print("Added articles: $addedArticles");
      // You can also show a snackbar or toast here to indicate successful addition to the cart
    } else {
      print("Item already in cart");
    }
  }

  void showSnackBar(String name, String uid) {
    Get.snackbar(
      'Added to Cart', // Title of the snackbar
      name, // Message of the snackbar
      animationDuration: Duration(milliseconds: 700),
      duration: Duration(milliseconds: 1200), // Set the duration to 1 second (adjust as needed)
      snackPosition: SnackPosition.TOP, // Show the snackbar from the top
      // You can add more options for the snackbar here if needed
    );
    //CC.addedArticles.addItemWhereUid = uid
  }


}
