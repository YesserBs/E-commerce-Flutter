import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/details/details_page.dart';
import 'package:myproj/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController HC = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (controller) => ListView.builder(
                  itemCount: controller.elements.length,
                  itemBuilder: (BuildContext context, int index) {
                    final element = controller.elements[index];
                    final String name = element['name'];
                    final String price = element['price'].toString();

                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(
                            DetailsPage(),
                            arguments: name, // Pass the name as an argument
                          );
                        },
                        title: Text(name),
                        subtitle: Text('Price: $price'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
