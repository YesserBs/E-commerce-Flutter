import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                          height: 40,
                          width: 81,
                          child: RoundedBorderTextButton(text: "Filter", onPressed: (){},)),
                      SizedBox(width: 10.0,),
                      Container(
                          height: 40,
                          width: 81,
                          child: RoundedBorderTextButton(text: "All", onPressed: (){},)),
                      SizedBox(width: 10.0,),
                      Container(
                          height: 40,
                          width: 81,
                          child: RoundedBorderTextButton(text: "Gadgets", onPressed: (){},)),
                      SizedBox(width: 10.0,),
                      Container(
                          height: 40,
                          width: 81,
                          child: RoundedBorderTextButton(text: "Clothes", onPressed: (){},)),
                      SizedBox(width: 10.0,),
                      Container(
                          height: 40,
                          width: 81,
                          child: RoundedBorderTextButton(text: "other", onPressed: (){},)),
                      SizedBox(width: 10.0,),
                      Container(
                          height: 40,
                          width: 81,
                          child: RoundedBorderTextButton(text: "other", onPressed: (){},)),

                    ],
                  ),
                ),
                elevation: 0.0,
                backgroundColor: Colors.white,
                expandedHeight: 274,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Image.asset("assets/images/soldes.jpeg"),
                      Positioned(
                        top: 210,
                        right: 300,
                        child: RoundedBorderTextButton(text: "S A L E S", onPressed: (){

                        },)
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: ProfilePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: 200,
            child: Center(
              child: Text(
                "data",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 200,
            child: Center(
              child: Text(
                "data",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 200,
            child: Center(
              child: Text(
                "data",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 200,
            child: Center(
              child: Text(
                "data",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 200,
            child: Center(
              child: Text(
                "data",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),


        ],
      ),
    );
  }
}


class RoundedBorderTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  RoundedBorderTextButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      //color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
        side: BorderSide(color: Colors.greenAccent),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}

