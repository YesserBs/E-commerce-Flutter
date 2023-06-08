import 'package:flutter/material.dart';

class C extends StatelessWidget {
  const C({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(padding: EdgeInsets.all(20.0)),
          Text("Page editer infos",
            style: TextStyle(
              fontSize: 30.0,
            ),),
          //Text("Hello"),




        ],
      ),
    );
  }
}


