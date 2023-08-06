import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproj/config/configuration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _showImage = false;

  void _toggleImage() {
    setState(() {
      _showImage = !_showImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
            ),
            Stack(
              children: [
                AnimatedContainer(
                  color: config.primaryColor,
                  duration: Duration(milliseconds: 300),
                  width: 411,
                  height: _showImage ? 255 : 0,
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    height: 231,
                    width: 411,
                    child: Image.asset('assets/images/PromoAd.jpg'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(width: 20.0,),
                GestureDetector(
                  onTap: () {
                    _toggleImage();
                  },
                  child: _showImage
                      ? Icon(CupertinoIcons.chevron_up, size: 15,)
                      : Icon(CupertinoIcons.chevron_down, size: 15,),
                ),
                SizedBox(width: 5,),
                Text("SALES")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
