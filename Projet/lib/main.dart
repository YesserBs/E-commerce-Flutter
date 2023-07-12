import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';


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
      initialRoute: '/home',
      initialBinding: HomeBinding(), // Assuming you have a separate binding class for the home route called HomeBinding
      theme: ThemeData(
        // Define your theme data here
        primaryColor: Colors.red,
        // ...
      ),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Text("Hello world",
              style: TextStyle(fontSize: 25.0, fontFamily: 'OstrichSans'),),
          ),
        ),
      ),
    );
  }
}

class HomeController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}





