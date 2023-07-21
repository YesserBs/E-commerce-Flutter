import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cText.dart';
import 'package:myproj/view/auth/auth.dart';
import 'package:myproj/view/auth/signup/signup_controller.dart';
import '../../custom/cButton.dart';
import '../cart/cart_page.dart';
import '../home/home_page.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  SignupController SC = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(backgroundColor: config.backgroundColor, elevation: 5, foregroundColor: config.secondaryColor),
          drawer: Drawer(backgroundColor: config.backgroundColor,
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
              Obx(() => cText(text: SC.username.value, changeFont: true, size: config.FontSizeTitle-20,),),
              150.h.verticalSpace,
              cButton(text: "Log out", icon: FontAwesomeIcons.signOut, onPressed: (){logOut();}
              )
            ],
          )),
          body: SafeArea(
            // The page that will be displayed from stack depending on the index from bottomNavBar index returned
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                CartPage(),
                IndexedStack(
                  index: controller.tabIndex,
                  children: [
                    HomePage(),
                    CartPage(),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: config.secondaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: config.backgroundColor,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.cart,
                label: 'Cart',
              ),
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
