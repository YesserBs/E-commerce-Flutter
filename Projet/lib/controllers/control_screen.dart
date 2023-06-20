import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myproj/Controllers/home_controller.dart';
import 'package:myproj/screens/cart.dart';
import 'package:myproj/screens/home.dart';
import 'package:myproj/screens/login.dart';
import 'package:myproj/screens/profil.dart';

class ControlScreen extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetBuilder<HomeController>(
        builder:(controller) => Scaffold(body: controller.navVal,
          bottomNavigationBar: _BottomNav(),),
      );
    });
  }


  Widget _BottomNav() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) =>
          BottomNavigationBar(
              selectedItemColor: Colors.grey[800],
              items: [
                BottomNavigationBarItem(
                    activeIcon: Text("Explore",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'OstrichSans'
                      ),
                    ),
                    label: "",
                    icon: Icon(FontAwesomeIcons.house,
                      size: 16.0,)
                ),
                BottomNavigationBarItem(
                    activeIcon: Text("Cart",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'OstrichSans'
                      ),
                    ),
                    label: "",
                    icon: Icon(FontAwesomeIcons.cartShopping,
                      size: 16.0,)
                ),
                BottomNavigationBarItem(
                    activeIcon: Text("Profile",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'OstrichSans'
                      ),
                    ),
                    label: "",
                    icon: Icon(FontAwesomeIcons.userLarge,
                      size: 16.0,)
                ),
              ],
              currentIndex: controller.navValue,
              onTap: (index) {
                controller.ChangeValue(index);
              }
          ),
    );
  }
}
