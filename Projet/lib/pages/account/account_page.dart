import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/pages/logging/log_in/login_page.dart';
import 'package:myproj/routes/app_pages.dart';

import 'account_controller.dart';

class AccountPage extends GetView<AccountController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 55.0,),
                Center(
                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                  ),
                ),
            SizedBox(height: 20.0,),
            Text("Username here",
            style: TextStyle(fontSize: 25.0, fontFamily: 'OstrichSans', color: Colors.grey[900]),),
            SizedBox(height: 50.0,),
            MyDevider(),
                SizedBox(height: 35.0,),
                ActionButton(Icons.edit, "Edit profile"),
                ActionButton(Icons.reorder, "Orders list"),
                ActionButton(Icons.settings, "Settings"),
                GestureDetector(
                  onTap: (){
                      final box = GetStorage();
                      box.write('isAuthenticated', false);
                      Get.off(LoginPage());
                  },
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.logout, size: 20.0),
                                  SizedBox(width: 15.0),
                                  Text(
                                    "Log out",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'OstrichSans',
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                ],
                              ),
                              Icon(FontAwesomeIcons.chevronRight, size: 15.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 35.0),
                    ],
                  ),
                ),

                MyDevider()

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget MyDevider(){
  return
    Divider(
    color: Colors.grey[400],
    thickness: 1,
    indent: 30,
    endIndent: 30,
  );

}

Widget ActionButton(IconData icon, String text) {
  return Column(
    children: [
      GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 20.0),
                  SizedBox(width: 15.0),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'OstrichSans',
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
              Icon(FontAwesomeIcons.chevronRight, size: 15.0),
            ],
          ),
        ),
      ),
      SizedBox(height: 35.0),
    ],
  );
}
