

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Search List Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: _controller.filterList,
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: _controller.filteredItems.length,
              itemBuilder: (context, index) {
                final item = _controller.filteredItems[index];
                return Card(
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}

class MyController extends GetxController {
  final items = [
    'apple',
    'banana',
    'orange',
    'grape',
    'watermelon',
    'kiwi',
  ].obs;

  final filteredItems = <String>[].obs;

  MyController() {
    filteredItems.assignAll(items);
  }

  void filterList(String value) {
    if (value.isEmpty) {
      filteredItems.assignAll(items);
    } else {
      filteredItems.assignAll(items.where((item) => item.contains(value)));
    }
  }
}


