import 'package:get/get.dart';
import 'package:myproj/objects/article.dart';
import 'package:myproj/view/cart/cart_controller.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  var lastIndex = 0; // Must be < 2 => the number of elements in bottomNavBar-1
  late Article item;
  CartController CC = Get.find();

  void changeTabIndex(int index) {
    print("Check INDEXES: $tabIndex, $lastIndex");
    if (tabIndex < 4){
      lastIndex = tabIndex;
    }
    if (index == 2){
      CC.calculateTotal();
    }
    tabIndex = index;
    update();
  }
}
