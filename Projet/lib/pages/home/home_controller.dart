import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> items = [
    {
      'id': 0,
      'nom': 'iPhone 12',
      'image': 'assets/images/IPhone.jpg',
      'marque': 'Apple',
      'prix': 1099,
      'added': 0
    },
    {
      'id': 1,
      'nom': 'iPhone SE',
      'image': 'assets/images/IPH5.webp',
      'marque': 'Apple',
      'prix': 499,
      'added': 0
    },
    {
      'id': 2,
      'nom': 'iPhone 13 Pro',
      'image': 'assets/images/IPH4.webp',
      'marque': 'Apple',
      'prix': 1299,
      'added': 0
    },
  ].obs;

  final filteredItems = <Map<String, dynamic>>[].obs;

  HomeController() {
    filteredItems.assignAll(items);
  }

  void filterList(String value) {
    if (value.isEmpty) {
      filteredItems.assignAll(items);
    } else {
      filteredItems.assignAll(items.where((item) => item['nom'].toLowerCase().contains(value.toLowerCase())));
    }
  }
}
