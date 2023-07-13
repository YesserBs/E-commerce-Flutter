import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/main_settings/appPages.dart';

String auth() {
  final box = GetStorage();
  final isAuthenticated = box.read('isAuthenticated') ?? false;
  print("$isAuthenticated");
  deleteVariable();
  if (isAuthenticated) {
    return AppPages.DASHBOARD;
  } else{
    return AppPages.LOGIN;
  }
}

void logOut() {
  final box = GetStorage();
  box.write('isAuthenticated', false);
  Get.offAllNamed(AppPages.LOGIN);
}


// In case i need to delete a getStorage variable
void deleteVariable() {
  final box = GetStorage();
  box.remove('isConnected');
}
