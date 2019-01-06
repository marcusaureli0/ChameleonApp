import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../util/custom_wigets.dart';
import '../services/status_service.dart';
import '../model/buddy_model.dart';
import 'dart:async';

class StatusScreen extends StatefulWidget {
  final Future<Post> post;

  const StatusScreen({Key key, this.post}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<BuddyModel> _status;

  @override
  void initState() {
    _status = StatusService.getAvailableStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {},
          leading: CircleAvatar(
              radius: 24.0,
              backgroundColor: Colors.blue[200],
              foregroundColor: Theme.of(context).primaryColor,
              backgroundImage: NetworkImage(
                  'https://vignette.wikia.nocookie.net/clubpenguin/images/f/f3/Troll.png/revision/latest?cb=20121222001812'),
              child: Text('M', style: TextStyle(color: Colors.white))),
          title:
              Text('My Status', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Text('Tap to add status update',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal)),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.grey[200],
                padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                child: Text('Recent updates',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _status.length,
            itemBuilder: (context, index) =>
                CustomWidgets.getBuddyStatusChild(_status[index]),
          ),
        ),
      ],
    );
  }
}
