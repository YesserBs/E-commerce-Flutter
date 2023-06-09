import 'package:flutter/material.dart';

class B extends StatefulWidget {
  const B({Key? key}) : super(key: key);

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> {
  String? dropdownValue;
  final TextEditingController jour = TextEditingController();
  final TextEditingController mois = TextEditingController();
  final TextEditingController annee = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200, // Set the desired width for the dropdown field
              child: DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: "n 1", child: Text("1")),
                  DropdownMenuItem(value: "n 2", child: Text("2")),
                  DropdownMenuItem(value: "n 3", child: Text("3")),
                  DropdownMenuItem(value: "n 4", child: Text("4")),
                  DropdownMenuItem(value: "n 5", child: Text("5")),
                  DropdownMenuItem(value: "n 6", child: Text("6")),
                  DropdownMenuItem(value: "n 7", child: Text("7")),
                  DropdownMenuItem(value: "n 8", child: Text("8")),
                ],
                value: dropdownValue,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Select an option",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: jour,
                    decoration: InputDecoration(
                      labelText: 'Field 1',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: mois,
                    decoration: InputDecoration(
                      labelText: 'Field 2',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: annee,
                    decoration: InputDecoration(
                      labelText: 'Field 3',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String fieldValue1 = jour.text;
                String fieldValue2 = mois.text;
                String fieldValue3 = annee.text;

                // Perform any desired actions with the form field values
                print('Field 1: $fieldValue1');
                print('Field 2: $fieldValue2');
                print('Field 3: $fieldValue3');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
