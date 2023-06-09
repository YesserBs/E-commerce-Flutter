import 'package:flutter/material.dart';
import 'A.dart';
import 'B.dart';
import 'C.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;
  int isC = 0;

  affecterIndex(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: [A(), B()][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => affecterIndex(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "accueil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.euro),
              label: "paiement",
            )
          ],
        ),
      ),
    );
  }
}






