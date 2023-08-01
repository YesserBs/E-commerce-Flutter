import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                SizedBox(height: 20),
                Obx(()=>
                    Expanded(
                    child: controller.SavedArticles.length > 0
                        ? Obx(
                          () => ListView.builder(
                        itemCount: controller.SavedArticles.length,
                        itemBuilder: (context, index) {
                          final item = controller.SavedArticles[index];
                          return Dismissible(
                            key: Key(item.uid),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              color: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Icon(
                                  Icons.delete,
                                  color: config.lightRed,
                                  size: 28,
                                ),
                              ),
                            ),
                            onDismissed: (_) {
                              controller.removeCartItem(item);
                            },
                            child: GestureDetector(
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
                                    right: 17,
                                    top: 41,
                                    //top: ,
                                    child: Icon(CupertinoIcons.cart, size: 24, color: config.secondaryColor,),
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
                                  Icon(FontAwesomeIcons.heartCirclePlus, size: 70, color: config.primaryColor,),
                                  110.h.verticalSpace,
                                  Text("List is empty", style: TextStyle(color: config.secondaryColor,
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
