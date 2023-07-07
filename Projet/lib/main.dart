import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/dashboard/dashboard_binding.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.LOGIN,
      initialBinding: DashboardBinding(),
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.grey[900]),
      ),
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}