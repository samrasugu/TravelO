import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: Colors.deepOrange,
    behavior: SnackBarBehavior.floating,
    elevation: 0.0,
  ));
}
