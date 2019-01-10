import 'package:flutter/material.dart';
import '../model/popup_item_model.dart';

class PopupController {
  static final PopupController _instance = PopupController._internal();

  factory PopupController() {
    return _instance;
  }

  PopupController._internal();

  List<PopupItemModel> getHomePopupList() {
    return [
      PopupItemModel('New group', Icons.group, PopupType.NewGroup),
      PopupItemModel('New transmission', Icons.call, PopupType.NewTransmission),
      PopupItemModel('Whatsapp Web', Icons.web, PopupType.WhatsappWeb),
      PopupItemModel(
          'Favorite messages', Icons.favorite, PopupType.FavoriteMessage),
      PopupItemModel('Settings', Icons.settings, PopupType.Settings)
    ];
  }
}

enum PopupType {
  NewGroup,
  NewTransmission,
  WhatsappWeb,
  FavoriteMessage,
  Settings
}
