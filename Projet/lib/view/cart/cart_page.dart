import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
                SizedBox(height: 20),
                Obx(() =>
                    Expanded(
                    child: cartController.addedArticles.length > 0
                        ? Obx(
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
                              cartController.removeCartItem(item, index);
                            },
                            child:
                            GestureDetector(
                              onTap: (){
                                Get.to(DetailsPage(), arguments: item);
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
                                          GestureDetector(
                                              child: Container(
                                                  height: 50,
                                                  child: Icon(CupertinoIcons.minus_rectangle, size: 20,)),
                                              onTap: (){
                                                if (item.added > 1){
                                                  cartController.decreaseAdded(item, index);
                                                }
                                              }
                                          ),
                                          Container(
                                              height: 150.h,
                                              width: 90.w,
                                              child: Center(child: Obx(() => Text(cartController.quantityList.value[index]!.toString(), style: TextStyle(fontSize: 18))))),
                                          GestureDetector(
                                              child: Container(
                                                  height: 50,
                                                  child: Icon(CupertinoIcons.plus_rectangle, size: 20,)),
                                              onTap: (){
                                                cartController.increaseAdded(item, index);
                                              }
                                          ),
                                          120.w.horizontalSpace,
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
                              ),
                            ),
                          );
                        },
                      ),
                    )
                        : Center(
                        child: Container(
                          height: 650.h,
                          width: 650.h,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Set the desired border radius value
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.cartPlus, size: 70, color: config.primaryColor,),
                                110.h.verticalSpace,
                                Text("Cart is empty", style: TextStyle(color: config.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26
                                ),)
                              ],
                            ),
                          ),
                        )
                    )
                )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}