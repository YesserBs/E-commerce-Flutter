import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myproj/config/configuration.dart';
import '../../custom/cText.dart';
import 'details_controller.dart';

class DetailsPage extends StatelessWidget {
  DetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    _controller.TheArticle = arguments;

    return Obx(() {
      // Observe the article property in the controller
      if (_controller.isLoading.value) {
        // Show an endless loading indicator while fetching the data
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 0, // set the size of the circle
            //valueColor: AlwaysStoppedAnimation<Color>(config.backgroundColor), // Change the color to your desired color
          ),
        );      } else {
        // Show the details when data is fetched
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    cText(
                      text: _controller.TheArticle.nom,
                      size: config.FontSizeTitle,
                      changeFont: true,
                    ),
                    cText(
                      text: "${_controller.TheArticle.prix.toString()} dts"
                      ,
                      size: config.FontSizeTitle,
                      changeFont: true,
                    ),
                    cText(
                      text: _controller.TheArticle.marque,
                      size: config.FontSizeTitle,
                      changeFont: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
