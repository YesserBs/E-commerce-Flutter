import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';

class B extends StatelessWidget {
  const B({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.find<MyController>();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current Index: ${myController.currentIndex.value}'),
            ],
          ),
        ),
      ),
    );
  }
}
