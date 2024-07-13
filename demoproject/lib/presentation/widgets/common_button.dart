import 'package:flutter/material.dart';

ElevatedButton commonButton(VoidCallback onPressed, String label) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(label),
  );
}
