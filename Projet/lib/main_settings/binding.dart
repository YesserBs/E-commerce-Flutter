import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:myproj/view/auth/signup/signup_controller.dart';
import 'package:myproj/view/dashboard/dashboard_controller.dart';
import '../view/auth/login/login_controller.dart';
import '../view/home/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
