import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../account/account_page.dart';
import '../cart/cart_page.dart';
import '../home/home_page.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  // DashboardController dashboardController =Get.find()
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.black87,),
          drawer: Drawer(),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                CartPage(),
                AccountPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey[500],
            selectedItemColor: Colors.grey[900],
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.cart,
                label: 'News',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Account',
              )
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
