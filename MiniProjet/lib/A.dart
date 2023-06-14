import 'package:flutter/material.dart';
import 'package:get/get.dart';

class A extends StatelessWidget {
  final RxList<Map<String, String>> personnes = [
    {
      "Nom": "Article 1",
      "prix": "?",
    },
    {
      "Nom": "Article 2",
      "prix": "?",
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Obx(
              () => ListView.builder(
            itemCount: personnes.length,
            itemBuilder: (context, index) {
              final personne = personnes[index];
              final nom = personne["Nom"];
              final age = personne["prix"];

              return GestureDetector(
                onTap: () {
                  print(nom); // Print the value of "Nom" when the card is tapped
                },
                child: Card(
                  child: ListTile(
                    title: Text("$nom"),
                    subtitle: Text("prix: $age"),
                    //trailing: Icon(Icons.more_vert),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
