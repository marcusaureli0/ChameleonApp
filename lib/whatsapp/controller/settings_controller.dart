import 'package:flutter/material.dart';
import 'package:chameleonapp/whatsapp/model/settings_item_model.dart';

class SettingsController {
  static final SettingsController _instance = SettingsController._internal();
  
  factory SettingsController() {
    return _instance;
  }

  SettingsController._internal();

  List<SettingsModel> getSettingsList() {
    var items = [
      'Account',
      'Chats',
      'Notifications',
      'Invite a friend',
      'Help'
    ];
    var icons = [
      Icons.vpn_key,
      Icons.chat,
      Icons.notifications,
      Icons.data_usage,
      Icons.group,
      Icons.help
    ];

    List<SettingsModel> settings = [];
    for (int i = 0; i < items.length; i++) {
      settings.add(SettingsModel(items[i], icons[i]));
    }

    return settings;
  }
}
