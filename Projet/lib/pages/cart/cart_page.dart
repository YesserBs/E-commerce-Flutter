import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class AlertsPage extends StatefulWidget {
  @override
  _AlertsPageState createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  final List<String> items = <String>[
    "IPhone A",
    "IPhone B",
    "IPhone C",
    "IPhone D",
    "IPhone E"
  ];

  bool isFormOpen = false; // Track whether the form is open or not
  TextEditingController textController = TextEditingController(); // Controller for the text input

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
          child: Column(
            children: [
              _ListItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ListItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: ListTile(
                      leading: Image.asset('assets/images/IPhone.jpg'),
                      title: Text(items[index]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Brand/ Seller'),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text('1000 dts'),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: Colors.grey[900],
                        size: 15.0,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        _showTextInputDialog(context); // Show the text input dialog
                      },
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.grey[900],
                        size: 15.0,
                      ),
                    ),
                  ],
                ),
                if (isFormOpen) _buildForm(), // Conditionally show the form
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm() {
    return TextFormField(
      controller: textController, // Set the controller for the text input
      // Implement your form logic here
      // Customize the TextFormField as per your requirements
      decoration: InputDecoration(
        labelText: 'Form Field',
      ),
    );
  }

  void _showTextInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Text'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Text'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Fermer la boîte de dialogue
                    },
                    child: Text('Annuler'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(textController.text);
                      Navigator.pop(context);
                    },
                    child: Text('Soumettre'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
