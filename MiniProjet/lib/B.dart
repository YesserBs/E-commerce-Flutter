import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'A.dart';
import 'main.dart';

class B extends StatelessWidget {
  const B({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxList<Map<String, String>> items = Get.find<A>().items;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text("Déscription:"),
              Text("Nombre d'articles: ${items.length}"),
            ],
          ),
        ),
      ),
    );
  }
}
