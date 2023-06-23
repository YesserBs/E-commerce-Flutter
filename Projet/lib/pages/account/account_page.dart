import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/account/account_controller.dart';
import 'package:myproj/pages/home/home_controller.dart';

import '../details/details_page.dart';

class AccountPage extends StatelessWidget {
  AccountController AC = Get.find<AccountController>(); // Retrieve the existing instance

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<AccountController>(
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
            Container(
              //height: 40,
              color: Colors.transparent,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total: 2400 dts",
                  style: TextStyle(
                    fontSize: 25,
                    //fontFamily: 'OstrichSans'
                  ),),
                  SizedBox(width: 15.0,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Icon(FontAwesomeIcons.plus, color: Colors.white,),
                          Text(
                            'Purshase',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
