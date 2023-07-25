import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import '../details/details_page.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cCard(),
                cText(text: "Cart page", size: config.FontSizeTitle, changeFont: true),
                SizedBox(height: 20),
                Expanded(
                  child: Obx(
                        () => ListView.builder(
                      itemCount: cartController.addedArticles.length,
                      itemBuilder: (context, index) {
                        final item = cartController.addedArticles[index];
                        return Dismissible(
                          key: Key(item),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            color: config.backgroundColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(
                                Icons.delete,
                                color: config.secondaryColor,
                              ),
                            ),
                          ),
                          onDismissed: (_) {
                            cartController.removeCartItem(item);
                          },
                          child: Card(
                            child: ListTile(
                              onTap: (){
                                Get.to(DetailsPage(), arguments: item);
                              },
                              title: cText(text: item),
                              // Add any other information you want to display for each item
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class cCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Section
            Row(
              children: [
                Image.asset(
                  'assets/images/IPhone.jpg',
                  width: 100,
                  height: 100,
                ),
                35.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cText(text: "iphone 13 pro", changeFont: true,),
                    cText(text: "Apple", size: 35,),
                    Text(
                      '90\$',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Right Section
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Implement minus button functionality
                  },
                  icon: Icon(CupertinoIcons.minus_rectangle, size: 20,),
                ),
                Text('1', style: TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: () {
                    // Implement plus button functionality
                  },
                  icon: Icon(CupertinoIcons.plus_rectangle, size: 20,),
                ),
                60.w.horizontalSpace,
                Stack(
                  children: [
                    Icon(Icons.star, color: config.backgroundColor,),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(CupertinoIcons.star, size: 22),
                    ),
                  ],
                ),
                15.w.horizontalSpace
              ],
            ),
          ],
        ),
      ),
    );
  }
}

