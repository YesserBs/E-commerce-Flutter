import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  var lastIndex = 0; // Must be < 2 => the number of elements in bottomNavBar-1

  void changeTabIndex(int index) {
    lastIndex = tabIndex;
    print(lastIndex);
    tabIndex = index;
    update();
  }
}
