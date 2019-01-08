import 'package:flutter/material.dart';

class PopupItemModel {
  String name;
  IconData icon;

  PopupItemModel(this.name, this.icon);
}

List<PopupItemModel> moreOptions = [
               PopupItemModel('New group', Icons.group),
                PopupItemModel('New transmission', Icons.call),
                PopupItemModel('Whatsapp Web', Icons.web),
                PopupItemModel('Favorite messages', Icons.favorite),
                PopupItemModel('Settings', Icons.settings)
              ];
