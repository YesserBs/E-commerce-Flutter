import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import 'package:myproj/view/auth/auth.dart';
import 'package:myproj/view/auth/signup/signup_controller.dart';
import 'package:myproj/view/profile/profile_page.dart';
import 'package:myproj/view/voucer/voucer_page.dart';
import 'package:myproj/view/wallet/wallet_page.dart';
import '../../custom/cButton.dart';
import '../cart/cart_page.dart';
import '../home/home_page.dart';
import '../save/save_page.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  SignupController SC = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          appBar: controller.tabIndex == 0 // Check if the index is 0
              ? null // Set the AppBar to null to hide it
              : AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: config.secondaryColor,
            actions: [
              IconButton(
              icon: Icon(CupertinoIcons.heart, size: 32, color: Colors.grey[800]),
              onPressed: () {
                Get.to(ProfilePage());
              },
            ),
              IconButton(
                icon: Icon(CupertinoIcons.cart, size: 32, color: Colors.grey[800]),
                onPressed: () {
                  Get.to(ProfilePage());
                },
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                800.h.verticalSpace,
                CircleAvatar(
                  radius: 165.sp,
                  backgroundColor: config.secondaryColor,
                  child: CircleAvatar(
                    radius: 160.sp,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                150.h.verticalSpace,
                Obx(() => cText(
                  text: SC.username.value,
                  changeFont: true,
                  size: config.FontSizeTitle - 20,
                )),
                150.h.verticalSpace,
                cButton(
                  text: "Log out",
                  icon: FontAwesomeIcons.signOut,
                  onPressed: () {
                    logOut();
                  },
                ),
              ],
            ),
          ),
          body: SafeArea(
            // The page that will be displayed from stack depending on the index from bottomNavBar index returned
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                VoucerPage(),
                WalletPage(),
                CartPage(),
                SavePage()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: config.lightGrey,
            selectedItemColor: config.primaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex < 3 ? controller.tabIndex : controller.lastIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: FontAwesomeIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.tickets_fill,
                label: 'Cart',
              ),
              _bottomNavigationBarItem(
                icon: FontAwesomeIcons.wallet,
                label: 'Saved',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 20),
      label: label,
    );
  }
}
