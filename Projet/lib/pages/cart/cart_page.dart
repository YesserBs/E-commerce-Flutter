import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  @override
  _AlertsPageState createState() => _AlertsPageState();
}

class _AlertsPageState extends State<CartPage> {
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
              // AlertDialog(),
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
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/IPhone.jpg',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'OstrichSans',
                                ),
                              ),
                              Text("1000 dts", style: TextStyle(
                                  fontSize: 14,
                                  //fontFamily: 'OstrichSans',
                                  color: Colors.grey[400]
                              ),),
                              //SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.grey[500],
                                      size: 15.0,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      _showTextInputDialog(context); 
                                    },
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'OstrichSans',
                                        color: Colors.grey[500]
                                      ),
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
                                      color: Colors.grey[500],
                                      size: 15.0,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
          title: Text('Product qantity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: textController,
                decoration: InputDecoration(labelText: ''),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancel',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OstrichSans',
                          color: Colors.grey[900]
                      ),),
                  ),
                  TextButton(
                    onPressed: () {
                      print(textController.text);
                      Navigator.pop(context);
                    },
                    child: Text('confirm',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OstrichSans',
                          color: Colors.grey[900]
                      ),),
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
