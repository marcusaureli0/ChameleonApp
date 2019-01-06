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

  static Widget getBuddyStatusChild(BuddyModel buddy,
      {double photoRadius, bool isEnd}) {
    return Column(children: <Widget>[
      ListTile(
        onTap: () {},
        leading: CircleAvatar(
            radius: photoRadius == null ? 28.0 : photoRadius,
            backgroundImage: NetworkImage(buddy.photoUrl),
            backgroundColor: Colors.blue[200]),
        title: Text(buddy.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(buddy.description,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal)),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 84.0),
        child: Divider(
          height: 1.0,
          color: isEnd == null
              ? Colors.grey[300]
              : isEnd ? Colors.transparent : Colors.grey[300],
        ),
      )
    ]);
  }
}
