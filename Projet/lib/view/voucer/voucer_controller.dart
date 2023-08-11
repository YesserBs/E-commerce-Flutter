import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VoucerController extends GetxController {
  var voucerIndex = 0.obs;
  var voucerApplied = false.obs;

  void getIndex(int value){
    voucerIndex.value = value;
    update();
  }

  void toggleVoucerApplied(){
    voucerApplied.value = !voucerApplied.value;
    print(voucerApplied.value);
    update();
  }

}
