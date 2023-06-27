import 'package:get/get.dart';
import 'package:myproj/pages/cart/cart_controller.dart';
import 'package:myproj/pages/home/home_controller.dart';

class DetailsController extends GetxController {
  CartController CC = Get.find();
  var selectedItem = {}.obs;

  void GetItem(Map<String, dynamic> value){
    selectedItem.value = value;
    update();
  }

  void AddItem(Map<String, dynamic> val){
    //CC.addedItems.add(selectedItem.value);
    selectedItem.value = val;
    update();
  }
}
