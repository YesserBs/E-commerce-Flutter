import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/pages/cart/cart_controller.dart';
import 'package:myproj/pages/details/details_controller.dart';
import 'package:myproj/pages/details/details_page.dart';

class CartPage extends StatelessWidget {
  CartController CC = Get.find();
  DetailsController DC = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
          child: Column(
            children: [
              // AlertDialog(),
              _ListItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ListItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: CC.addedItems.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(DetailsPage());
                    DC.GetItem(CC.addedItems[index]);
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          Image.asset(
                            CC.addedItems[index]['image'],
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  CC.addedItems[index]['nom'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'OstrichSans',
                                  ),
                                ),
                                Text(CC.addedItems[index]['prix'].toString(), style: TextStyle(
                                    fontSize: 14,
                                    //fontFamily: 'OstrichSans',
                                    color: Colors.grey[400]
                                ),),
                                //SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        CC.decrement(index);
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.minus,
                                        color: Colors.grey[700],
                                        size: 15.0,
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: 'Choose quantity',
                                          content: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                                                child: TextFormField(
                                                  controller: CC.textController,
                                                ),
                                              ),
                                            ],
                                          ),
                                          titleStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          confirmTextColor: Colors.white,
                                          cancelTextColor: Colors.grey[900],
                                          buttonColor: Colors.grey[900],
                                          textCancel: 'Cancel',
                                          textConfirm: 'Submit',
                                          onCancel: () {
                                            Get.back();
                                          },
                                          onConfirm: () {
                                            String enteredName = CC.textController.text;
                                            print(enteredName);
                                            Get.back();
                                          },
                                        );
                                      },
                                      child: Obx(()=>Text(
                                        CC.Quantity.value.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'OstrichSans',
                                            color: Colors.grey[700]
                                        ),
                                      ),
                                      ),),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        CC.increment(index);
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        color: Colors.grey[700],
                                        size: 15.0,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
