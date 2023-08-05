import 'package:get/get.dart';
import 'package:myproj/objects/article.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  var lastIndex = 0; // Must be < 2 => the number of elements in bottomNavBar-1
  late Article item;

  void changeTabIndex(int index) {
    print("Check INDEXES: $tabIndex, $lastIndex");
    if (tabIndex < 4){
      lastIndex = tabIndex;
    }
    tabIndex = index;
    update();
  }
}
