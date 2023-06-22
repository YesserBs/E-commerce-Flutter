import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[200], // Set button color to red
          ),
          onPressed: () {
            // Handle button press
          },
          icon: Icon(Icons.add,color: Colors.black),
          label: Text('Add', style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}





