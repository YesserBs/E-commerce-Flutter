import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/cart.dart';
import '../screens/home.dart';
import '../screens/profil.dart';

class HomeController extends GetxController {
  int _navValue = 0;

  get navValue => _navValue;
  Widget _navVal = HomeScreen();
  get navVal => _navVal;

  void ChangeValue(int val)
  {
    _navValue = val;
    switch (val) {
      case 0:
        {
          _navVal = CartScreen();
          break;
        }
      case 1:
        {
          _navVal = CartScreen();
          break;
        }
      case 2:
        {
          _navVal = ProfilScreen();
          break;
        }
    }
    update();
  }
}