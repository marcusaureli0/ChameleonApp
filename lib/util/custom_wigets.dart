import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget getTextWidget(String message) {
    return Text(
      message,
      style: TextStyle(
        color: Colors.black54,
        letterSpacing: 1.0,
      ),
    );
  }
}
