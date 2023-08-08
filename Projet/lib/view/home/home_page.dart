import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/cart/cart_controller.dart';
import 'package:myproj/view/dashboard/dashboard_controller.dart';
import 'package:myproj/view/details/details_controller.dart';
import 'package:myproj/view/home/home_controller.dart';
import 'package:myproj/view/save/save_controller.dart';
import '../../custom/cText.dart';
import '../../objects/user.dart';

class HomePage extends StatelessWidget {
  UserController userController = UserController();
  DashboardController DC = Get.find();
  HomeController HC = Get.find();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 106,
                  ),
                  Positioned(
                    top: 59,
                      left: 5,
                      right: 5,
                      height: 34,
                      child: Obx(()=>
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildTextContainer("FOR YOU"),
                              50.0.w.horizontalSpace,
                              buildTextContainer("SHOES"),
                              50.0.w.horizontalSpace,
                              buildTextContainer("HATS"),
                              50.0.w.horizontalSpace,
                              buildTextContainer("PANTS")
                            ],
                          )
                      )
                  ),
                  Positioned(
                    child: _SearchFormField(),
                  ),
                  Positioned(
                    top: 12.0,
                    right: 8.0,
                    child: GestureDetector(
                        onTap: (){
                          DC.changeTabIndex(4);
                        },
                        child: Icon(CupertinoIcons.cart, size: 32, color: Colors.grey[800],
                        )
                    ),
                  ),
                  Positioned(
                    top: 12.0,
                    right: 56.0,
                    child: GestureDetector(
                      onTap: (){
                        DC.changeTabIndex(5);
                      },
                        child: Icon(CupertinoIcons.heart, size: 32, color: Colors.grey[800])),
                  ),

                  Positioned(
                    bottom: -20,
                      child:
                      Container(
                        height: 30.0,
                          width: 412.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40.0)),
                      )
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          HC.toggleShowImage();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 25,
                              color: Colors.transparent,
                              child: Obx(()=>Row(
                                children: [
                                  130.w.horizontalSpace,
                                  HC.showAd.value
                                      ? Icon(CupertinoIcons.chevron_up, color: config.secondaryColor, size: 17,)
                                      : Icon(CupertinoIcons.chevron_down, color: config.secondaryColor, size: 17),
                                  SizedBox(width: 5,),
                                  cText(text: "S A L E S", size: 45,)

                                ],
                              ),)

                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        width: 120,
                        height: 25,
                        child: Center(child: cText(text: "FILTER", size: 45)),
                      )
                    ],
                  ),
                  Obx(() => _buildAnimatedContainer()),
                ],
              ),
              _ListItems()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _SearchFormField() {
  HomeController _controller = Get.find();
  return Container(
    height: 35.0,
    margin: EdgeInsets.fromLTRB(25.0, 12.0, 110.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(9),
      border: Border.all(
        color: config.secondaryColor, // Set the color of the border
        width: 1.2, // Set the width of the border
      ),
    ),
    child: TextFormField(
      onChanged: _controller.getSearchText,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: config.secondaryColor,
        ),
      ),
      style: TextStyle(color: Colors.black), // Set the text color of the TextFormField
    ),
  );
}
Widget _ListItems() {
  HomeController _controller = Get.find();
  CartController CC = Get.find();
  SaveController SC = Get.find();
  DetailsController detailsController = Get.find();
  DashboardController dashboardController = Get.find();

  return Expanded(
    child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.78.h,
              children: List.generate(_controller.filteredArticles.length, (index) {
            final item = _controller.filteredArticles[index];
            return Stack(
              children: [
                Card(
                  //color: Colors.blue,
                  child: GestureDetector(
                    onTap: () {
                      detailsController.getArguments(item);
                      dashboardController.changeTabIndex(6);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(item.image[0]),
                        50.h.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cText(
                                text: item.nom,
                                changeFont: true,
                                size: 65,
                              ),
                              cText(text: item.marque, size: 35,),
                              10.h.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$${item.prix.toString()}.00",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: config.primaryColor, fontSize: 19),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          int CartIndex = CC.addedArticles.indexOf(item);
                                          if (!CC.addedArticles.contains(item))
                                          {
                                            CC.addToCart(item);
                                          }
                                          else {
                                            CC.removeCartItem(item, CartIndex);
                                          }
                                        },
                                        child: Container(
                                            child: CC.addedArticles.contains(item) ? Icon(
                                              CupertinoIcons.xmark,
                                              size: 20,
                                              color: Colors.grey,
                                            )
                                                : Icon(
                                              CupertinoIcons.cart,
                                              size: 25,
                                              color: Colors.grey,
                                            )
                                        ),
                                      ),
                                      75.w.horizontalSpace
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 17,
                  right: 10,
                  child: Icon(CupertinoIcons.heart_fill, size: 25, color: SC.SavedArticles.contains(item) ? Colors.red[300] : Colors.transparent),
                ),

                Positioned(
                  top: 17,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (!SC.SavedArticles.contains(item))
                      {
                        SC.addToSave(item);
                      }
                      else {
                        SC.removeCartItem(item);
                      }
                    },
                    child: Icon(CupertinoIcons.heart, size: 25, color: SC.SavedArticles.contains(item) ? Colors.red[300] : config.secondaryColor),
                  ),
                ),
              ],
            );
        }),
      ),
          ),
    ),
  );
}


OutlinedButton createBorderedButton(Widget child, VoidCallback onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      backgroundColor: config.lightGrey,
      //side: BorderSide(width: 1, color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: child,
  );
}

class DropdownButtonWidget extends StatefulWidget {
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  // List of items for the dropdown menu
  List<String> _items = ['All', 'Gadgets', 'Clothes', 'Others'];

  // The currently selected item
  String _selectedItem = 'All';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue!;
        });
      },
      items: _items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}


GestureDetector buildTextContainer(String text) {
  HomeController HC = Get.find();

  return GestureDetector(
    onTap: (){
      if (HC.type.value == text){
        HC.type.value = '';
      }
      else{
        HC.type.value = text;
        print(HC.type.value);
      }
      HC.filterList(HC.searchedText);
    },
    child: Container(
      width: 100,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(
          color:
          HC.type.value == text
          ? config.primaryColor
          : config.lightGrey,
          width: 1.2, // Specify the border width
        ),
        borderRadius: BorderRadius.circular(7), // Adjust the value as per your desired border radius
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight:
            HC.type.value == text
                ? FontWeight.bold
                : null,
            color:
            HC.type.value == text
                ? config.primaryColor
                : config.lightGrey,
          ),
        ),
      ),
    ),
  );
}


Widget _buildAnimatedContainer() {
  HomeController HC = Get.find();

  return Stack(
    children: [
      AnimatedContainer(
        //
        duration: Duration(milliseconds: 300),
        width: 410,
        height: HC.showAd.value ? 255 : 0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          //color: Colors.grey[400],
        ),
      ),
      Positioned(
        right: 0, // This is not useless, shall be kept
        top: 0, // Same thing here
        child: Container(
          height: 255,
          child: Image.asset("assets/images/PromoAd.jpg"),
        ),
      )
    ],
  );
}