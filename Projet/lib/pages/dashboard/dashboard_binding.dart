import 'package:get/get.dart';
import 'package:myproj/pages/cart/cart_controller.dart';
import 'package:myproj/pages/details/details_controller.dart';


import '../account/account_controller.dart';
import '../home/home_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
