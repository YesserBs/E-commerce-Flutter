import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../objects/article.dart';

class CartController extends GetxController {
  final addedArticles = <Article>[].obs;

  Future<void> addUidToCart(Article item) async {
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



  Future<Article?> fetchArticleByUID(String uid) async {
    try {
      final DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('items').doc(uid).get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          return Article(
            uid: snapshot.id, // Use the UID as the ID for the Article object
            nom: data['nom'] as String? ?? '',
            image: data['image'] as String? ?? '',
            marque: data['marque'] as String? ?? '',
            prix: data['prix'] as int? ?? 0,
            added: data['added'] as int? ?? 0,
          );
        }
      }
      return null; // Return null if the document doesn't exist or data is null
    } catch (e) {
      print('Error fetching article: $e');
      return null;
    }
  }

  void removeCartItem(String item) {
    addedArticles.remove(item);
  }



}
