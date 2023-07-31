import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                              color: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(
                                  Icons.delete,
                                  color: config.lightRed,
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
                              child: Stack(
                                children: [
                                  Card(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          item.image,
                                          width: 100,
                                          height: 100,
                                        ),
                                        Row(
                                          children: [
                                            80.w.horizontalSpace,
                                            Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                100.h.verticalSpace,
                                                cText(text: item.nom, changeFont: true,),
                                                cText(text: item.marque, size: 40,),
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
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 100,
                                      top: 40,
                                      child: GestureDetector(
                                          child: Container(
                                              height: 20,
                                              child: Icon(CupertinoIcons.minus_square, size: 26, color: config.primaryColor,)),
                                          onTap: (){
                                            if (item.added > 1){
                                              cartController.decreaseAdded(item, index);
                                            }
                                          }
                                      ),),
                                  Positioned(
                                    right: 65,
                                    top: 40,
                                      child: Container(
                                          height: 60.h,
                                          width: 90.w,
                                          child: Center(child: Obx(() => Text(cartController.quantityList.value[index]!.toString(), style: TextStyle(fontSize: 19))))),
                                  ),
                                  Positioned(
                                    right: 40,
                                    top: 40,
                                      child: GestureDetector(
                                          child: Container(
                                              height: 20,
                                              child: Icon(CupertinoIcons.plus_app_fill, size: 26, color: config.primaryColor,)),
                                          onTap: (){
                                            cartController.increaseAdded(item, index);
                                          }
                                      ),
                                  ),
                                  Positioned(
                                      right: 10,
                                    top: 40,
                                      //top: ,
                                      child: Stack(
                                        children: [
                                          Icon(CupertinoIcons.heart_fill, color: Colors.transparent, size: 22),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Icon(CupertinoIcons.heart, size: 22, color: config.secondaryColor,),
                                          ),
                                        ],
                                      ),
                                  )
                                ],
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