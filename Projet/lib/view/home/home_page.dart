import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/home/home_controller.dart';
import '../../custom/cText.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              cText(text: "Home page", size: config.FontSizeTitle, changeFont: true),

              _SearchFormField(),
              100.h.verticalSpace,
              _ListItems()


            ],
          ),
        ),
      ),
    );
  }
}

Widget _SearchFormField() {
  HomeController _controller = Get.find();
  return Container(
    margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(40),
    ),
    child: TextFormField(
      onChanged: _controller.filterList,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
        ),
      ),
    ),
  );
}

Widget _ListItems() {
  HomeController _controller = Get.find();

  return Expanded(
    child: Obx(
          () => GridView.count(
        crossAxisCount: 2, // Display two cards in each row
        childAspectRatio: 0.7, // Adjust the desired aspect ratio here
        children: List.generate(_controller.filteredArticles.length, (index) {
          final item = _controller.filteredArticles[index];
          return Card(
            child: ListTile(
              onTap: () {
                // Handle onTap event
              },
              title: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Container(
                        height: 150.0,
                        child: Image.asset(item.image)),
                    Text(
                      item.nom,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'OstrichSans',
                        color: Colors.grey[900],
                      ),
                    ),
                    Text(item.marque),
                    SizedBox(height: 2.0),
                    Text("${item.prix.toString()} dts"),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    ),
  );
}

