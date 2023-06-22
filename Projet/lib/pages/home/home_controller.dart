import 'package:get/get.dart';

class HomeController extends GetxController {
  var items = <String>["Item"];
  void addItem() {
    items.add('New item');
    update();
  }
}
