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
          padding: EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ListItems(),
              Container(
                color: Colors.white,
                height: 70.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Obx(()=>Text("Total: ${CC.Total.value} dts",
                            style: TextStyle(fontSize: 25.0,
                                fontFamily: 'OstrichSans',
                                color: Colors.grey[800]),),),

                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Action to perform when the button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 60),
                        ),
                        child: Text("Purchase",
                          style: TextStyle(fontSize: 25.0,
                              fontFamily: 'OstrichSans',
                              color: Colors.grey[800]),),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _ListItems() {

    if (CC.addedItems.length == 0){
      return Expanded(child: Container(
        child: Center(child: const Text("No items added",
          style: TextStyle(fontSize: 20.0),),),
      ));
    }
    else{
      return Expanded(
        child: ListView.builder(
          itemCount: CC.addedItems.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: Key(CC.addedItems[index]['nom']), // Use a unique key for each item
              onDismissed: (direction) {
                CC.removeItem(index);
              },


              child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      CC.swipeItem(index);
                      Get.to(DetailsPage());
                      DC.GetItem(CC.addedItems[index]);
                      print("added items: ${CC.addedItems}");

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
                                          color: Colors.grey[800],
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
                                              String value = CC.textController.text;
                                              CC.changeValue(index, int.parse(value));
                                              Get.back();
                                            },
                                          );
                                        },
                                        child: Obx(()=>Text(
                                          CC.TheText(index),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'OstrichSans',
                                              color: Colors.grey[800]
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
                                          color: Colors.grey[800],
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
            ),
            );
          },
        ),
      );
    }
  }
}