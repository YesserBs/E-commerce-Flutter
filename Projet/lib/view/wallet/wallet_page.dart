import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cToggleButton.dart';

class WalletPage extends StatelessWidget {
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
                            Text(
                              '421.00',
                              style: TextStyle(fontSize: 38, color: config.secondaryColor, fontWeight: FontWeight.bold),
                            ),
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
                            // Your onPressed action here
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
                            // Your onPressed action here
                          },
                        ),
                      ),
                    )

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
                            // Your onPressed action here
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
            190.h.verticalSpace,
            ToggleButton(leftText: 'Transactions', left: 32, rightText: 'Top-ups', right: 43,),
            200.h.verticalSpace,
            Container(
              height: 410,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: config.lightPrimaryColor,
              ),
            )

          ],
        ),
      ),
    );
  }
}

