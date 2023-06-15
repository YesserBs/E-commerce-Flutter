import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';

class A extends StatelessWidget {
  final MyController myController = Get.find<MyController>();
  final RxList<Map<String, String>> items = [
    {
      "Nom": "Article 1",
      "prix": "?",
    },
    {
      "Nom": "Article 2",
      "prix": "?",
    },
  ].obs;


  final TextEditingController search = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0), // Adjust vertical padding here
      child: Column(
        children: [
          SizedBox(height: 25.0,),
          TextField(
            controller: search,
            onChanged: (value) {
              // search logic
            },
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0), // Set the border radius here
              ),
            ),
          ),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final nom = item["Nom"];
                  final prix = item["prix"];

                  return GestureDetector(
                    onTap: () {
                      print(nom); // Print the value of "Nom" when the card is tapped
                    },
                    child: Card(
                      child: ListTile(
                        title: Text("$nom"),
                        subtitle: Text("prix: $prix"),
                        //trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}