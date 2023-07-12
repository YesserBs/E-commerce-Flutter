import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/auth/login/login_page.dart';
import '../view/home/home_page.dart';
import 'binding.dart';

class AppPages {
  static const String DASHBOARD = '/';
  static const String LOGIN = '/login';

  static var list = [
    GetPage(
      name: DASHBOARD,
      page: () => HomePage(),
      binding: Binding(),
    ),
    GetPage(
      name: LOGIN,
      page: () => LoginPage(),
      binding: Binding(),
    ),
  ];
}

