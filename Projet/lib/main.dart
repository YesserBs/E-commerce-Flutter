import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/main_settings/appPages.dart';
import 'package:myproj/view/auth/auth.dart';
import 'package:myproj/view/profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(1080, 2340));
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 274,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset("assets/images/soldes.jpeg"),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                child: ProfilePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
