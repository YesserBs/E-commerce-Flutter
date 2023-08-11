import 'package:get/get.dart';

class WalletController extends GetxController {
  var credits = 450.obs;
  var isLeft = false.obs;

  void changeCredits(int value){
    if (credits.value > -value){
      credits.value = credits.value + value;
    }
    update();
  }

  void GetIsLeft(bool value){
    isLeft.value = value;
    update();
  }
}
