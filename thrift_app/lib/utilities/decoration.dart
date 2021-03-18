import 'package:flutter/material.dart';

InputDecoration formDecoratorion(String label) {
  return InputDecoration(labelText: label);
}

InputDecoration authDecoration(String label) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
    border: OutlineInputBorder(),
    labelText: label,
  );
}
