import 'package:flutter/material.dart';

TextFormField textFieldWidget(TextEditingController controller, String label,
    {bool isPassword = false}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '$label can\'t be empty';
      }
      if (label == 'Email' && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        return 'Please enter a valid email';
      }
      if (label == 'Password' && value.length < 6) {
        return 'Password must be at least 6 characters long';
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: label,
      hintText: label,
    ),
  );
}
