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
      appBar: AppBar(),

      drawer: Drawer(child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(70.0),
          child: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Text("Text"),),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Text("Text"),),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Text("Text"),),

        ],),),
      )),
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
  Rx<String> ch = ''.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
  void test(String saisie) {
    ch.value = saisie;
    print(ch.value);
  }
}