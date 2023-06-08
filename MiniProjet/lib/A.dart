import 'package:flutter/material.dart';

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  final personnes = [

    {
      "Nom": "Mark",
      "Age": "20",
    },
    {
      "Nom": "Edaurdo",
      "Age": "23",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      ListView.builder(
        itemCount: personnes.length,
        itemBuilder: (context, index){
          final personne = personnes[index];
          final nom = personne["Nom"];
          final age = personne["Age"];

          return Card(
            child: ListTile(
              title: Text("$nom"),
              subtitle: Text("age: $age"),
              //trailing: Icon(Icons.more_vert),
            ),
          );

        }
      ),
    );
  }
}



