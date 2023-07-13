import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/main_settings/appPages.dart';
import 'package:myproj/view/auth/auth.dart';

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
      initialRoute: auth(),//auth(),
      //initialBinding: Binding(),
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: config.secondaryColor),
      ),
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}








