


import 'package:get/get.dart';

class HomeController extends GetxController {
  int _navValue = 0;

  get navValue => _navValue;
  void ChangeValue(int val)
  {
    _navValue = val;
    update();
  }
}