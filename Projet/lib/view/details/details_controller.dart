import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../objects/article.dart';

class DetailsController extends GetxController {
  late Article arguments = Article(); // Initialize the field
  var quantity = 1.obs;

  void increaseQuantity(){
    quantity++;
  }

  void decreaseQuantity(){
    if (quantity > 1){
      quantity--;
    }
  }

  void setQuantity(int value, int argumentsAdded){
    if (value == -1){
      quantity.value = 1;
    }
    else{
      quantity.value = argumentsAdded;
    }
  }

  void getArguments(Article item) {
    arguments = item;
  }

  void createDefaultArticle() {
    // Creating an instance of Article with default values
    Article defaultArticle = Article();

    // Calling getArguments to set the defaultArticle as arguments
    getArguments(defaultArticle);
  }
}
