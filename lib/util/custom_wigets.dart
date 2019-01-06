import 'package:flutter/material.dart';
import '../model/buddy_model.dart';

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

  static Widget getBuddyStatusChild(BuddyModel buddy) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
          radius: 24.0,
          backgroundImage: NetworkImage(buddy.photoUrl),
          backgroundColor: Colors.blue[200]),
      title: Text(buddy.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Text(buddy.time,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14.0,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
