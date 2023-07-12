import 'package:flutter/material.dart';

class cTextFormField extends TextFormField {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  cTextFormField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    Key? key,
  }) : super(
    key: key,
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
    ),
    obscureText: obscureText,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your $labelText';
      }
      return null;
    },
  );
}
