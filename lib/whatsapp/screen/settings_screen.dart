import 'package:flutter/material.dart';
import 'package:chameleonapp/whatsapp/controller/widget_controller.dart';
import 'package:chameleonapp/whatsapp/model/buddy_model.dart';
import 'package:chameleonapp/whatsapp/controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  final BuddyModel buddy = BuddyModel(
      'Marcus Aurélio',
      'my status',
      'https://vignette.wikia.nocookie.net/clubpenguin/images/f/f3/Troll.png/revision/latest?cb=20121222001812',
      0);

  Widget getSettingsList() {
    List<Widget> childrens = [
      WidgetController().getBuddyStatusChild(buddy, isEnd: true),
      Divider(height: 1.0)
    ];

    SettingsController().getSettingsList().forEach((item) {
      childrens.add(ListTile(
        onTap: () {},
        leading: Icon(item.icon, color: Color(0xff075E54)),
        title: Text(item.name),
      ));

      childrens.add(Container(
          padding: EdgeInsets.only(left: 70.0), child: Divider(height: 1.0)));
    });

    return Column(children: childrens);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings', style: TextStyle(color: Colors.white)),
          elevation: 1.0,
          centerTitle: false,
        ),
        body: SingleChildScrollView(child: getSettingsList()));
  }
}