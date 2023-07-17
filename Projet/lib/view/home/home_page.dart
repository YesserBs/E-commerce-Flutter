import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/home/home_controller.dart';
import '../../custom/cText.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                cText(text: "Search", size: config.FontSizeTitle, changeFont: true),
                _SearchFormField(),
                100.h.verticalSpace,
                Expanded(child: _ListItems()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();
    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        onChanged: _controller.filterList,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: config.secondaryColor,
          ),
        ),
      ),
    );
  }
}

class _ListItems extends StatefulWidget {
  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<_ListItems> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          _handleScroll();
        }
        return false;
      },
      child: GridView.count(
        controller: _scrollController,
        crossAxisCount: 2,
        childAspectRatio: 1.8.h,
        children: List.generate(_controller.filteredArticles.length, (index) {
          final item = _controller.filteredArticles[index];
          return Card(
            child: ListTile(
              onTap: () {
                // Handle onTap event
              },
              title: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Container(
                      height: 400.0.w,
                      child: Image.asset(item.image),
                    ),
                    50.h.verticalSpace,
                    cText(
                      text: item.nom,
                      changeFont: true,
                    ),
                    Text(item.marque),
                    10.h.verticalSpace,
                    Text("${item.prix.toString()} dts"),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
