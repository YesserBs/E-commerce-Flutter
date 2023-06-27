import 'package:get/get.dart';
import 'package:myproj/pages/home/home_controller.dart';

class DetailsController extends GetxController {
  var selectedItem = {}.obs;

  void GetItem(Map<String, dynamic> value){
    selectedItem.value = value;
    update();
  }
}
