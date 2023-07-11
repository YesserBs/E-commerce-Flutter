import 'package:get/get.dart';
import 'package:myproj/pages/cart/cart_controller.dart';

import '../../custom/article.dart';
import '../home/home_controller.dart';

class DetailsController extends GetxController {
  CartController CC = Get.find();
  RxString txt = "Add to cart".obs;
  RxMap<String, dynamic> selectedItem = RxMap<String, dynamic>();
  final HomeController homeController = Get.find();
  late Article currentItem;

  void getItem(Article item) {
    currentItem = item;
  }


  void GetItem(Map<String, dynamic> value){
    selectedItem.value = value;
    updateButton();
    update();
  }

  void updateButton(){
    print("Value: ${selectedItem["added"]}");
    if (selectedItem["added"] > 0){
      txt.value = "Remove";
    }
    else{
      txt.value = "Add to cart";
    }
    update();
  }
}
