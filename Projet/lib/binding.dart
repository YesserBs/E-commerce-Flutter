

import 'package:get/get.dart';
import 'package:myproj/Controllers/home_controller.dart';

class Bind extends Bindings{

  @override
  void dependencies()
  {
    Get.lazyPut(() => HomeController());

  }
}