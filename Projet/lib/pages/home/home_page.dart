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
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Card(
                        color: Colors.red[200],
                        child: ListTile(
                          onTap: () {
                            Get.to(DetailsPage());
                          },
                          title: Center(
                            child: Text(
                              controller.items[index],
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'OstrichSans',
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[200], // Set button color to red
              ),
              onPressed: () {
                HC.addItem();
              },
              icon: Icon(Icons.add, color: Colors.black),
              label: Text(
                'Add',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
