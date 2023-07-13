import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/dashboard/dashboard_controller.dart';

import '../../main_settings/appPages.dart';
import '../auth/auth.dart';

class DashboardPage extends StatelessWidget {
  DashboardController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: config.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ElevatedButton(onPressed: (){
                final box = GetStorage();
                box.write('isAuthenticated', false);
                Get.offAllNamed(AppPages.LOGIN);
              },
                  child: Text("Log out"))],
            ),
          ),
        ),
      ),
    );
  }
}
