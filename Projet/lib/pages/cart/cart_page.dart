import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/pages/cart/cart_controller.dart';
import 'package:myproj/pages/details/details_page.dart';

class CartPage extends StatelessWidget {
  CartController CC = Get.find();
  final List<String> items = <String>[
    "IPhone A",
    "IPhone B",
    "IPhone C",
  ];

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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                      Get.to(DetailsPage());
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/IPhone.jpg',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'OstrichSans',
                                  ),
                                ),
                                Text("1000 dts", style: TextStyle(
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
                                        CC.decrement();
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
                                        CC.increment();
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

