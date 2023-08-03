import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../objects/article.dart';

class DetailsController extends GetxController {
  Rx<Article> article = Rx<Article>(Article());
  var quantity = 1.obs;

  void increaseQuantity(){
    quantity++;
  }

  void decreaseQuantity(){
    quantity--;
  }
}
