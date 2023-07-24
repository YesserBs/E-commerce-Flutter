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
    _controller.fetchArticleByUid(arguments);

    return Obx(() {
      // Observe the article property in the controller
      if (_controller.isLoading.value) {
        // Show an endless loading indicator while fetching the data
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Customize the color if needed
          ),
        );
      } else {
        // Show the details when data is fetched
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: cText(
                  text: _controller.article.value.nom,
                  size: config.FontSizeTitle,
                  changeFont: true,
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
