import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/services/auth.dart';
import 'package:myproj/pages/dashboard/dashboard_binding.dart';
import 'package:myproj/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: auth(),
      initialBinding: DashboardBinding(),
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.grey[900]),
      ),
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}


