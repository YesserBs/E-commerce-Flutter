import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class CounterController extends GetxController {
  var count = 0.obs; // Use ".obs" to make it observable

  void increment() {
    count.value++; // Access the value using ".value"
  }
}

class MyApp extends StatelessWidget {
  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Get Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                'Count: ${_counterController.count.value}', // Access the value using ".value"
                style: TextStyle(fontSize: 24),
              )),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _counterController.increment(),
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
