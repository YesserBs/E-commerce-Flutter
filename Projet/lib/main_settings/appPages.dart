import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/home/home_page.dart';
import 'binding.dart';

class AppPages {
  static var list = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: Binding(),
    ),
  ];
}