import 'package:flutter/material.dart';
import '../controller/popup_controller.dart' show PopupType;

class PopupItemModel {
  String name;
  IconData icon;
  PopupType type;

  PopupItemModel(this.name, this.icon, this.type);
}
