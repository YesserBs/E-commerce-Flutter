import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myproj/config/configuration.dart';
import '../../custom/cText.dart';
import '../dashboard/dashboard_controller.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: cText(
                  text: arguments,
                  size: config.FontSizeTitle,
                  changeFont: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
