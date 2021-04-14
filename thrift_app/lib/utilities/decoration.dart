import 'package:flutter/material.dart';

InputDecoration formDecoratorion(String label) {
  return InputDecoration(
    labelText: label,
    contentPadding: EdgeInsets.symmetric(vertical: 0),
  );
}

InputDecoration iDecoration(String label,
    {double borderRadius, Widget suffixIcon}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    contentPadding: EdgeInsets.symmetric(horizontal: 15),
    border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(borderRadius == null ? 4 : borderRadius)),
    labelText: label,
  );
}
