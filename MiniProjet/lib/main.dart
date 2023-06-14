import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'A.dart';
import 'B.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.put(MyController());

    return Scaffold(
      body: Obx(() => [A(), B()][myController.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: myController.currentIndex.value,
          onTap: (index) => myController.changePage(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Page A",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Page B",
            ),
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
