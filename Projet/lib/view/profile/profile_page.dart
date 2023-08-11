import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/profile/profile_controller.dart';
import '../../custom/cToggleButton.dart';

class ProfilePage extends StatelessWidget {
  ProfileController PC = Get.find();
  late ToggleButton TButton;
  var Gifts = ["Ali_123 gifted you", "You gifted Mohammed"];
  var Contacts = ["Ali_123", "Mohammed", "User_20" , "User_20", "User_20", "User_20", "User_20"];


  ProfilePage() {
    TButton = ToggleButton(
      leftText: 'Contacts',
      left: 38,
      rightText: 'Gifts',
      right: 55,
      onIsLeftChanged: PC.GetIsLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 10, 15),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 130.sp,
                                  backgroundColor: config.lightGrey,
                                  child: CircleAvatar(
                                    radius: 125.sp,
                                    backgroundImage: AssetImage('assets/images/ProfileP.jpg'),
                                  ),
                                ),
                                Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                ),
                                Positioned(
                                  bottom: 13,
                                    right: 3,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User_123",
                                style: TextStyle(
                                  fontFamily: 'OstrichSans',
                                  fontSize: 23,
                                ),
                              ),
                              Text(
                                "user@gmail.com",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    100.h.verticalSpace,
                    Text(
                      "Add a contact",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14
                      ),

                    ),
                    60.h.verticalSpace,
                    SearchFormField('Contact added successfully'),
                    200.h.verticalSpace,
                    TButton,
                    100.h.verticalSpace,
                    Expanded(
                      child: Obx(() => ListView.builder(
                        itemCount:
                        PC.isLeft.value
                            ? Contacts.length
                            : Gifts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Row(
                                children: [
                                  150.w.horizontalSpace,
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 93.sp,
                                        backgroundColor: config.lightGrey,
                                        child: CircleAvatar(
                                          radius: 90.sp,
                                          backgroundImage: AssetImage('assets/images/ProfileP.jpg'),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 3,
                                          right: 0,
                                          child: Container(
                                            height: 18,
                                            width: 18,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                      ),
                                      Positioned(
                                          bottom: 5,
                                          right: 2,
                                          child: Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 4),
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
                                            width: 190,
                                            color: Colors.transparent,
                                            child: Text(
                                              PC.isLeft.value
                                                  ? Contacts[index]
                                                  : Gifts[index],
                                              style: TextStyle(fontSize: 15, ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.more_vert,
                                            size: 19,
                                            color: config.primaryColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  150.w.horizontalSpace,
                                ],
                              ),
                            );
                        },
                      ),),
                    )

                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}


Widget SearchFormField(String message) {
  ProfileController _controller = Get.find();
  return Container(
    height: 36.0,
    margin: EdgeInsets.symmetric(horizontal: 65.0),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(9),
      border: Border.all(
        color: config.lightGrey, // Set the color of the border
        width: 1.2, // Set the width of the border
      ),
    ),
    child: TextFormField(
      onChanged: _controller.getSearchText,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: GestureDetector(
          onTap: (){
            _controller.showSnackBar(message, _controller.searchedText);
          },
          child: Icon(
            CupertinoIcons.plus,
            color: config.lightGrey,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      ),
      style: TextStyle(color: config.secondaryColor), // Set the text color of the TextFormField
    ),
  );
}