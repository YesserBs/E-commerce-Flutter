import 'package:flutter/material.dart';
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
                cText(text: "Cart page", size: config.FontSizeTitle, changeFont: true),
                SizedBox(height: 20),
                Expanded(
                  child: Obx(
                        () => ListView.builder(
                      itemCount: cartController.addedArticles.length,
                      itemBuilder: (context, index) {
                        final item = cartController.addedArticles[index];
                        return Dismissible(
                          key: Key(item.uid),
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
                              title: cText(text: item.nom),
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
