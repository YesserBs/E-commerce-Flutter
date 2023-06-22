import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/details/details_page.dart';


class HomePage extends StatelessWidget {
  final List<String> items = <String>["Hello world!"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListItems(),
          ],
        ),
        //bottomNavigationBar: _BottomNav(),
      ),
    );
  }

  Widget _ListItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            child: Card(
              color: Colors.red[200],
              child: ListTile(
                onTap: () {
                  Get.to(DetailsPage());
                },
                title: Center(
                  child: Text(items[index],
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'OstrichSans',
                        color: Colors.grey[900]
                    ),),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

