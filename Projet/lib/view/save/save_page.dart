import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import 'package:myproj/view/save/save_controller.dart';
import '../details/details_page.dart';


class SavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SaveController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cText(text: "Save page", size: config.FontSizeTitle, changeFont: true),
                SizedBox(height: 20),
                Expanded(
                  child: Obx(
                        () => ListView.builder(
                      itemCount: controller.SavedArticles.length,
                      itemBuilder: (context, index) {
                        final item = controller.SavedArticles[index];
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
                            controller.removeCartItem(item);
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left Section
                                  Row(
                                    children: [
                                      Image.asset(
                                        item.image,
                                        width: 100,
                                        height: 100,
                                      ),
                                      35.w.horizontalSpace,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          cText(text: item.nom, changeFont: true,),
                                          cText(text: item.marque, size: 35,),
                                          Text(
                                            '${item.prix}\$',
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
                                      60.w.horizontalSpace,
                                      Stack(
                                        children: [
                                          Icon(CupertinoIcons.cart_fill, color: config.backgroundColor),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Icon(CupertinoIcons.cart),
                                          ),
                                        ],
                                      ),
                                      15.w.horizontalSpace
                                    ],
                                  ),
                                ],
                              ),
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
