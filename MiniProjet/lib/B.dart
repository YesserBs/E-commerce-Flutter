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
      child: Text("Page 2")
    );
  }
}