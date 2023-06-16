import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'A.dart';
import 'B.dart';

void main() {
  runApp(const MyApp());
}


Container createCircularContainer(double radius, Color color) {
  return Container(
    width: radius,
    height: radius,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
  );
}

Container CustomContainer(String text) {
  return Container(
    margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
    padding: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.blue,
    ),
    child: Center(
      child:
      Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.0),
      ),
    ),
  );
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
          padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 25.0),
          child: Column(children: [
            CustomContainer("Text"),
            CustomContainer("Text"),
            CustomContainer("Text"),

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
  Rx<String> nom = ''.obs;
  Rx<String> prenom = ''.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
  void test(String ch1, String ch2) {
    nom.value = ch1;
    prenom.value = ch2;
    print(nom.value);
    print(prenom.value);
  }
}