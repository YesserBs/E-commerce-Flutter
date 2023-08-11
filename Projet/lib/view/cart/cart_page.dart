import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import 'package:myproj/view/dashboard/dashboard_controller.dart';
import 'package:myproj/view/save/save_controller.dart';
import '../details/details_controller.dart';
import '../details/details_page.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final SaveController SC = Get.find();
    DetailsController detailsController = Get.find();
    DashboardController dashboardController = Get.find();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>
                Expanded(
                child: cartController.addedArticles.length > 0
                    ? Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
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
                              padding: EdgeInsets.only(right: 25),
                              child: Icon(
                                Icons.delete,
                                color: config.lightRed,
                                size: 28,
                              ),
                            ),
                          ),
                          onDismissed: (_) {
                            cartController.removeCartItem(item, index);
                            cartController.calculateTotal();
                          },
                          child:
                          GestureDetector(
                            onTap: (){
                              detailsController.getArguments(item);
                              dashboardController.changeTabIndex(6);
                            },
                            child: Stack(
                              children: [
                                Card(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        item.image[0],
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
                                  right: 102,
                                    top: 40,
                                    child: GestureDetector(
                                        child: Container(
                                            height: 20,
                                            child: Icon(CupertinoIcons.minus_square, size: 26, color: config.primaryColor,)),
                                        onTap: (){
                                          if (item.added > 1){
                                            cartController.decreaseAdded(item, index);
                                          }
                                          cartController.calculateTotal();
                                        }
                                    ),),
                                Positioned(
                                  right: 71,
                                  top: 40,
                                    child: Container(
                                        height: 60.h,
                                        width: 90.w,
                                        child: Center(child: Obx(() => Text(cartController.quantityList.value[index]!.toString(), style: TextStyle(fontSize: 19))))),
                                ),
                                Positioned(
                                  right: 48,
                                  top: 40,
                                    child: GestureDetector(
                                        child: Container(
                                            height: 20,
                                            child: Icon(CupertinoIcons.plus_app_fill, size: 26, color: config.primaryColor,)),
                                        onTap: (){
                                          cartController.increaseAdded(item, index);
                                          cartController.calculateTotal();
                                        }
                                    ),
                                ),
                                Positioned(
                                    right: 13,
                                  top: 42,
                                    //top: ,
                                    child: Obx(()=> Stack(
                                      children: [
                                        Icon(CupertinoIcons.heart_fill,color: SC.SavedArticles.contains(item) ? Colors.red[300] : Colors.transparent, size: 22),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: (){
                                                if (!SC.SavedArticles.contains(item))
                                                  {
                                                    SC.addToSave(item);
                                                  }
                                                else {
                                                  SC.removeCartItem(item);
                                                }
                                              },
                                              child: Icon(CupertinoIcons.heart, size: 22, color: SC.SavedArticles.contains(item) ? Colors.red[300] : config.secondaryColor)),
                                        ),
                                      ],
                                    )),
                                )
                              ],
                            ),
                          ),
                        );
                    },
                  ),
                      ),
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        500.h.verticalSpace,
                        Container(
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
                        ),
                      ],
                    )
            )
            ),
            Container(
              height: 65,

              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), // Shadow color
                      spreadRadius: 1, // How far the shadow extends
                      blurRadius: 50, // The blur radius
                      offset: Offset(0.5, 0.5), // Offset of the shadow
                    ),
                  ],
                  color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Row(
                    children: [
                      220.w.horizontalSpace,
                      Obx(()=>
                          Text("Total: \$  ${cartController.total}.00",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey
                            ),)
                      ),

                    ],
                  ),

                  Row(
                    children: [
                      Text("To: You",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey
                          )),
                      220.w.horizontalSpace,
                    ],
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