import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/dashboard/dashboard_controller.dart';
import 'package:myproj/view/details/details_page.dart';
import 'package:myproj/view/home/home_controller.dart';
import '../../custom/cText.dart';
import '../../objects/user.dart';
import '../auth/signup/signup_controller.dart';




class HomePage extends StatelessWidget {
  UserController userController = UserController();
  SignupController SC = Get.find();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Obx(() => cText(text: SC.username.value, size: config.FontSizeTitle, changeFont: true),),
                cText(text: "Search", size: config.FontSizeTitle, changeFont: true),
                _SearchFormField(),
                100.h.verticalSpace,
                _ListItems()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _SearchFormField() {
  HomeController _controller = Get.find();
  return Container(
    margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(40),
    ),
    child: TextFormField(
      onChanged: _controller.filterList,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: config.secondaryColor,
        ),
      ),
    ),
  );
}

Widget _ListItems() {
  HomeController _controller = Get.find();
  DashboardController DC = Get.find();

  void _showSnackBar(String item) {
    Get.snackbar(
      'Added to Cart', // Title of the snackbar
      item, // Message of the snackbar
      animationDuration: Duration(milliseconds: 700),
      duration: Duration(milliseconds: 1200), // Set the duration to 1 second (adjust as needed)
      snackPosition: SnackPosition.TOP, // Show the snackbar from the top
      // You can add more options for the snackbar here if needed
    );
  }


  return Expanded(
    child: Obx(
          () => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.7.h,
        children: List.generate(_controller.filteredArticles.length, (index) {
          final item = _controller.filteredArticles[index];
          return Card(
            child: ListTile(
              onTap: () {
                Get.to(DetailsPage());
              },
              title: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Container(
                      height: 400.0.w,
                      child: Image.asset(item.image),
                    ),
                    50.h.verticalSpace,
                    cText(
                      text: item.nom,
                      changeFont: true,
                    ),
                    Text(item.marque),
                    10.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item.prix.toString()} Dts",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              _showSnackBar("ok"); // Show snackbar on button press
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                              EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              primary: config.backgroundColor,
                              elevation: 0.0.sp,
                            ),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    ),
  );
}

