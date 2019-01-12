import 'package:flutter/material.dart';
import 'package:chameleonapp/whatsapp/controller/popup_controller.dart' show PopupType;

class PopupItemModel {
  String name;
  IconData icon;
  PopupType type;

  PopupItemModel(this.name, this.icon, this.type);
}
