import 'package:get/get.dart';

class AccountController extends GetxController {
  final List<Map<String, dynamic>> elements = [];
  var name = ''.obs;

  void NewItem(String ItemName) {
    elements.add({'name': '$ItemName', 'price': 10});
    update();
  }
}
