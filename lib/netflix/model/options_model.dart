import 'package:flutter/material.dart';

class OptionsModel {
  String title;
  IconData icon;

  OptionsModel({this.title, this.icon})
      : assert(title != null),
        assert(icon != null);
}
