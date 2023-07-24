import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../objects/article.dart';

class DetailsController extends GetxController {
  RxBool isLoading = RxBool(false);
  Rx<Article> article = Rx<Article>(Article());

  Future<void> fetchArticleByUid(String uid) async {
    try {
      isLoading.value = true; // Set loading to true when fetching starts

      final DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('items').doc(uid).get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        article.value = Article(
          uid: snapshot.id,
          nom: data['nom'] as String? ?? '',
          image: data['image'] as String? ?? '',
          marque: data['marque'] as String? ?? '',
          prix: data['prix'] as int? ?? 0,
          added: data['added'] as int? ?? 0,
        );
        print('retrieved');
      } else {
        article.value = Article(); // Update the value to an empty Article
        print("Message from: else in details controller in fetchArticleByUid");
      }

      isLoading.value = false; // Set loading to false when fetching completes
    } catch (e) {
      print('Error fetching article by uid: $e');
      article.value = Article(); // Update the value to an empty Article
      isLoading.value = false; // Set loading to false in case of an error
    }
  }
}
