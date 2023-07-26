import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/objects/article.dart';
import '../../custom/cText.dart';
import 'details_controller.dart';

class DetailsPage extends StatelessWidget {
  DetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Article arguments = Get.arguments;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: cText(
              text: arguments.nom,
              size: config.FontSizeTitle,
              changeFont: true,
            ),
          ),
        ),
      ),
    );
  }
}
