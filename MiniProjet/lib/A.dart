import 'package:flutter/material.dart';

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  final personnes = [
    {
      "Nom": "Article 1",
      "Age": "?",
    },
    {
      "Nom": "Article 2",
      "Age": "?",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ListView.builder(
          itemCount: personnes.length,
          itemBuilder: (context, index) {
            final personne = personnes[index];
            final nom = personne["Nom"];
            final age = personne["Age"];

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
    );
  }
}



