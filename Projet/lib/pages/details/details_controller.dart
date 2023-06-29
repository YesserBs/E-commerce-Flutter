import 'package:get/get.dart';
import 'package:myproj/pages/cart/cart_controller.dart';

class DetailsController extends GetxController {
  CartController CC = Get.find();
  RxMap<String, dynamic> selectedItem = RxMap<String, dynamic>();

  void GetItem(Map<String, dynamic> value){
    selectedItem.value = value;
    update();
  }
}
