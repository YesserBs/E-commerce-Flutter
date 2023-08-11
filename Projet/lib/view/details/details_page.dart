import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/cart/cart_controller.dart';
import 'package:myproj/view/details/details_controller.dart';
import 'package:myproj/view/save/save_controller.dart';


class DetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CartController CC = Get.find();
    SaveController SC = Get.find();
    DetailsController DC = Get.find();

    int CartIndex = CC.addedArticles.indexOf(DC.arguments);
    DC.setQuantity(CartIndex, DC.arguments.added);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 410,
                        child: ShoeCarousel(imagePaths: DC.arguments.image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            30.h.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.mapMarkerAlt,
                                      color: config.lightGrey,
                                    ),
                                    20.w.horizontalSpace,
                                    Text(
                                      DC.arguments.marque,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: config.lightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                    if (!SC.SavedArticles.contains(DC.arguments))
                                    {
                                      SC.addToSave(DC.arguments);
                                    }
                                    else {
                                      SC.removeCartItem(DC.arguments);
                                    }
                                  },
                                  child: Obx(() => Stack(
                                    children: [
                                      Icon(
                                        CupertinoIcons.heart_fill,
                                        color: SC.SavedArticles.contains(DC.arguments) ? Colors.red[300] : Colors.transparent,
                                        size: 28,
                                      ),
                                      Positioned(
                                        child: Icon(
                                          CupertinoIcons.heart,
                                          color: SC.SavedArticles.contains(DC.arguments) ? Colors.red[300] : config.secondaryColor,
                                          size: 28,
                                        ),
                                      )
                                    ],
                                  )),
                                )
                              ],
                            ),
                            50.h.verticalSpace,
                            Text(
                              DC.arguments.nom,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: config.secondaryColor,
                              ),
                            ),
                            50.h.verticalSpace,
                            Text(
                              "\$${DC.arguments.prix.toString()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: config.primaryColor,
                              ),
                            ),
                            50.h.verticalSpace,
                            Text(
                                DC.arguments.description,
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 175.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  50.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          120.w.horizontalSpace,
                          GestureDetector(
                            onTap: (){
                              if (!CC.addedArticles.contains(DC.arguments)){
                                DC.decreaseQuantity();
                              }
                            },
                            child: Obx(() => Icon(CupertinoIcons.minus_square,
                              color: CC.addedArticles.contains(DC.arguments)
                                  ? config.lightGrey
                                  : config.primaryColor,
                              size: 37,),),
                          ),
                          Obx(() => Container(
                              height: 50,
                              width: 35,
                              //color: Colors.red,
                              child: Center(child:
                              Text(DC.quantity.value.toString(),
                                style: TextStyle(fontSize: 20,
                                color: CC.addedArticles.contains(DC.arguments)
                                    ? config.lightGrey
                                    : config.secondaryColor,),))),),
                          Obx(() => GestureDetector(
                            onTap: (){
                              if (!CC.addedArticles.contains(DC.arguments)){
                                DC.increaseQuantity();
                              }
                            },
                            child: Icon(CupertinoIcons.plus_app_fill,
                              color: CC.addedArticles.contains(DC.arguments)
                                  ? config.lightGrey
                                  : config.primaryColor,
                              size: 37,),
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              CartIndex = CC.addedArticles.indexOf(DC.arguments);
                              if (CartIndex == -1)
                              {
                                CC.addToCart(DC.arguments);
                                CC.changeAdded(DC.quantity.value, CC.addedArticles.indexOf(DC.arguments));
                                DC.arguments.added = DC.quantity.value;

                              }
                              else {
                                CC.removeCartItem(DC.arguments, CartIndex);
                              }
                            },
                            child: Obx(() =>
                            Container(
                              height: 50,
                              width: 560.w,
                              decoration: BoxDecoration(
                                  color:
                                  CC.addedArticles.contains(DC.arguments)
                                      ? config.lightGrey
                                      : config.primaryColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text(
                                  CC.addedArticles.contains(DC.arguments)
                                      ? "REMOVE"
                                      : "ADD TO CART",

                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)),
                            )),
                          ),
                          100.w.horizontalSpace
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoeCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const ShoeCarousel({required this.imagePaths});

  @override
  _ShoeCarouselState createState() => _ShoeCarouselState();
}

class _ShoeCarouselState extends State<ShoeCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    int imageIndex = 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 380,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.imagePaths.length,
            itemBuilder: (context, index) {
              imageIndex = index;
              return ShoeImage(imagePath: widget.imagePaths[imageIndex]);
            },
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            widget.imagePaths.length,
                (index) => _buildDot(index),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: 8,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? config.primaryColor : Colors.grey[300],
      ),
    );
  }
}

class ShoeImage extends StatelessWidget {
  final String imagePath;

  const ShoeImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
