import 'package:flutter/material.dart';

class SettingsModel {
  String name;
  IconData icon;
  
  SettingsModel(this.name, this.icon);
}

enum SettingsType {
  Account,
  Chat,
  Notification,
  StoreAndData,
  InviteFriend,
  Help
}
