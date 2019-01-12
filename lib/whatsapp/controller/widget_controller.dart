import 'package:flutter/material.dart';
import 'package:chameleonapp/whatsapp/model/buddy_model.dart';
import 'package:chameleonapp/whatsapp/model/call_log_model.dart';

class WidgetController {
  static final WidgetController _instance = WidgetController._internal();

  factory WidgetController() {
    return _instance;
  }

  Widget getTextWidget(String message) {
    return Text(
      message,
      style: TextStyle(
        color: Colors.black54,
        letterSpacing: 1.0,
      ),
    );
  }

  Widget getCallLogChild(CallLogModel log, {double photoRadius, bool isEnd}) {
    return Column(children: <Widget>[
      ListTile(
        onTap: () {},
        leading: CircleAvatar(
            radius: photoRadius == null ? 28.0 : photoRadius,
            backgroundImage: NetworkImage(log.photoUrl),
            backgroundColor: Colors.blue[200]),
        trailing: IconButton(
          onPressed: () {},
          tooltip: log.callStream == CallStream.Call ? 'Call' : 'Video Call',
          icon: log.callStream == CallStream.Call
              ? Icon(Icons.call, color: Color(0xff075E54))
              : Icon(Icons.videocam, color: Color(0xff075E54)),
        ),
        title: Text(log.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Row(
            children: <Widget>[
              Icon(
                  log.callType == CallType.Outgoing
                      ? Icons.call_made
                      : Icons.call_received,
                  color: log.callType == CallType.Outgoing
                      ? Colors.green[400]
                      : Colors.red[400],
                  size: 18.0),
              Text(log.description,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal)),
            ],
          ),
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

  Widget getBuddyStatusChild(BuddyModel buddy,
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

  WidgetController._internal();
}
