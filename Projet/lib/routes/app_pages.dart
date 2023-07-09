import 'package:get/get.dart';
import 'package:myproj/main.dart';
import '../pages/dashboard/dashboard_binding.dart';
import '../pages/dashboard/dashboard_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginForm(),
      binding: DashboardBinding(),
    ),
  ];
}
