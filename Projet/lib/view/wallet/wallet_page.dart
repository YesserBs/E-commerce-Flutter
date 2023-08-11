import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cToggleButton.dart';
import 'package:myproj/view/cart/cart_controller.dart';
import 'package:myproj/view/wallet/wallet_controller.dart';

class WalletPage extends StatelessWidget {
  WalletController WC = Get.find();
  CartController CC = Get.find();
  final Transactions = [["\$180.00", "\$150.50", "\$5.00", "\$6.00"], ["11", "2", "4", "1"]];
  final TopUps = ["\$20.00", "\$400.00", "\$1.00"];
  late ToggleButton TButton;
  final TextEditingController _numberController = TextEditingController();

  WalletPage() {
    TButton = ToggleButton(
      leftText: 'Transactions',
      left: 32,
      rightText: 'Top-ups',
      right: 43,
      onIsLeftChanged: WC.GetIsLeft,
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 530.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, config.lightPrimaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        270.h.verticalSpace,
                        Text("Available funds", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(fontSize: 25, color: config.secondaryColor, fontWeight: FontWeight.bold),
                            ),
                            30.w.horizontalSpace,
                            Obx(() => Text(
                              "${WC.credits.value.toString()}.00",
                              style: TextStyle(fontSize: 38, color: config.secondaryColor, fontWeight: FontWeight.bold),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: Container(

                    height: 60,
                    width: 411,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                ),
                /* I have to make a fonction that returns a Button wwith
                the icon because there is a lot of repetition*/
                Positioned(
                    left: 50,
                    bottom: 10,
                    child: Material(
                      elevation: 1.8, // Adjust the elevation value as needed
                      shape: CircleBorder(),
                      color: Colors.white,
                      child: SizedBox(
                        width: 63,
                        height: 65,
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.plus,
                            color: Colors.grey[700],
                            size: 25,
                          ),
                          onPressed: () {
                            _showInputDialog(context, "Add credits to wallet", "Confirm", "Enter the amout", "add");// Print statement added
                          },
                        ),
                      ),
                    )

                ),
                Positioned(
                  left: 175,
                  bottom: 10,
                  child: Material(
                    elevation: 1.8, // Adjust the elevation value as needed
                    shape: CircleBorder(),
                    color: Colors.white,
                    child: SizedBox(
                      width: 63,
                      height: 65,
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.creditcard,
                          color: Colors.grey[700],
                          size: 25,
                        ),
                        onPressed: () {
                          _showInputDialog(context, "Confirm paying the cart", "Confirm", "\$ ${CC.total.value}.00", "pay");
                          print(_numberController.text);
                        },
                      ),
                    ),
                  ),
                ),

                Positioned(
                    left: 300,
                    bottom: 10,
                    child: Material(
                      elevation: 1.8, // Adjust the elevation value as needed
                      shape: CircleBorder(),
                      color: Colors.white,
                      child: SizedBox(
                        width: 63,
                        height: 65,
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.grey[700],
                            size: 25,
                          ),
                          onPressed: () {
                            _showInputDialog(context, "Send credits", "Next", "Enter the amout", "send");// Print statement added
                          },
                        ),
                      ),
                    )

                )
              ],
            ),
            Row(
              children: [
                460.w.horizontalSpace,
                Text("Add"),
                710.w.horizontalSpace,
                Text("Pay"),
                680.w.horizontalSpace,
                Text("Send")
              ],
            ),
            170.h.verticalSpace,
            TButton,
            200.h.verticalSpace,
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(horizontal: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  ),),
                  Obx(() => Visibility(
                    visible: WC.isLeft.value, // Condition ici (1==1 est toujours vrai)
                    child: Text(
                      "Articles",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  )),
                  Text("Date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]
                    ),),
                ],
              ),
            ),
            60.h.verticalSpace,

            Expanded(
              child: Obx(() =>
                  Container(
                    height: 390,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      //color: config.lightRed,
                    ),
                    child: ListView.builder(
                      itemCount:
                      WC.isLeft.value
                          ? Transactions[1].length
                          : TopUps.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          WC.isLeft.value
                              ? Container(
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,boxShadow: [
                              BoxShadow(
                                color: config.lightPrimaryColor, // Shadow color
                                spreadRadius: 1, // How much the shadow spreads
                                blurRadius: 2,   // The blur effect of the shadow
                                offset: Offset(0.5, 0.5), // Offset in x and y direction
                              ),
                            ],

                            ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 90,
                                      color: Colors.transparent,
                                      child: Text(
                                        Transactions[0][index], // Replace with your actual data
                                        style: TextStyle(fontSize: 15, ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          Transactions[1][index], // Replace with your actual data
                                          style: TextStyle(fontSize: 15, ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "08/08/2023", // Replace with your actual data
                                      style: TextStyle(fontSize: 15, color: config.primaryColor),
                                    ),
                              ],
                            ),
                          )
                              : Container(
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,boxShadow: [
                              BoxShadow(
                                color: config.lightPrimaryColor, // Shadow color
                                spreadRadius: 1, // How much the shadow spreads
                                blurRadius: 2,   // The blur effect of the shadow
                                offset: Offset(0.5, 0.5), // Offset in x and y direction
                              ),
                            ],

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TopUps[index], // Replace with your actual data
                                  style: TextStyle(fontSize: 15, ),
                                ),
                                Text(
                                  "08/08/2023", // Replace with your actual data
                                  style: TextStyle(fontSize: 15, color: config.primaryColor),
                                ),
                              ],
                            ),
                          );
                      },
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showInputDialog(BuildContext context, String instruction, String buttonText, String subtitle, String type) {
    Get.defaultDialog(
      title: instruction,
      content: Column(
        children: [
          Text(subtitle,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700]
          ),),
          if (type != "pay")
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
            ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  child: Text('Cancel'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.back();
                  int enteredNumber = int.tryParse(_numberController.text) ?? 0;
                  print('Entered Number: $enteredNumber');
                  if (type == "add"){
                    WC.changeCredits(enteredNumber);
                  }
                  else if (type == "pay"){
                    if (WC.credits.value > CC.total.value){
                      WC.changeCredits(-CC.total.value);
                      CC.showSnackBar("Items purshased successfully", "${CC.addedArticles.length.toString()} articles purchased");
                    }
                    else{
                      CC.showSnackBar("Error", "You don't have enough credits");
                    }
                  }
                },
                child: Container(
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

