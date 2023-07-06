import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/dashboard/dashboard_binding.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      initialRoute: AppRoutes.DASHBOARD,
      initialBinding: DashboardBinding(),
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.grey[900]),
      ),
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}