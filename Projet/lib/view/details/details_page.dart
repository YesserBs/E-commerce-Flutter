import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/objects/article.dart';
import '../../custom/cText.dart';
import 'details_controller.dart';

class DetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Article arguments = Get.arguments;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                450.h.verticalSpace,
                Container(
                  height: 350,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      150.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.mapMarkerAlt, color: config.lightGrey,),
                              20.w.horizontalSpace,
                              Text(arguments.marque,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: config.lightGrey
                                ),),
                            ],
                          ),
                          Stack(
                            children: [
                              Icon(CupertinoIcons.heart_fill, color: Colors.transparent, size: 28,),
                              Positioned(
                                  child: Icon(CupertinoIcons.heart, color: Colors.grey[700], size: 28))
                            ],
                          )
                        ],
                      ),
                      50.h.verticalSpace,
                      Text(arguments.nom, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                      50.h.verticalSpace,
                      cText(
                        text: "A vibrant and elegant dress, crafted from soft, flowing silk, adorned with delicate floral patterns that dance across its pastel blue fabric. Its A-line silhouette flatters any figure, and the subtle sweetheart neckline adds a touch of romance.",
                        size: config.FontSizeNormal,
                        changeFont: false,
                      ),
                      50.h.verticalSpace,
                      Text("${arguments.prix.toString()}\$",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
