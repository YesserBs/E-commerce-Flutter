import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/objects/article.dart';
import '../../custom/cText.dart';


class DetailsPage extends StatelessWidget {
  final List<String> imagePaths = [
    "assets/images/shoe.webp",
    "assets/images/shoe2.webp",
    "assets/images/shoe3.webp",
  ];

  @override
  Widget build(BuildContext context) {
    Article arguments = Get.arguments;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    print("Back");
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 130.h,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        80.w.horizontalSpace,
                        Icon(CupertinoIcons.back, size: 27, color: Colors.grey[800],),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 410,
                        child: ShoeCarousel(imagePaths: imagePaths),
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
                                      arguments.marque,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: config.lightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.transparent,
                                      size: 28,
                                    ),
                                    Positioned(
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Colors.grey[700],
                                        size: 28,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            50.h.verticalSpace,
                            Text(
                              arguments.nom,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: config.secondaryColor,
                              ),
                            ),
                            50.h.verticalSpace,
                            Text(
                              "${arguments.prix.toString()}\$",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: config.primaryColor,
                              ),
                            ),
                            50.h.verticalSpace,
                            Text(
                              "A vibrant and elegant dress, crafted from soft, flowing silk, adorned with delicate floral patterns that dance across its pastel blue fabric. Its A-line silhouette flatters any figure, and the subtle sweetheart neckline adds a touch of romance. A vibrant and elegant dress, crafted from soft, flowing silk, adorned with delicate floral patterns that dance across its pastel blue fabric. Its A-line silhouette flatters any figure, and the subtle sweetheart neckline adds a touch of romance",
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
              height: 200.h,
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
                          Icon(CupertinoIcons.minus_square, color: config.primaryColor,size: 37,),
                          Container(
                            height: 50,
                              width: 35,
                              //color: Colors.red,
                              child: Center(child: Text("1", style: TextStyle(fontSize: 20, color: config.secondaryColor),))),
                          Icon(CupertinoIcons.plus_app_fill, color: config.primaryColor, size: 37,),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 560.w,
                            decoration: BoxDecoration(
                              color: config.primaryColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text("ADD TO CART", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)),
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
              return ShoeImage(imagePath: widget.imagePaths[index]);
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
        color: _currentPage == index ? Colors.green : Colors.grey[300],
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
