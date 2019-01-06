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
  BuddyModel mySelf;

  @override
  void initState() {
    _status = StatusService.getAvailableStatus();
    mySelf = BuddyModel(
        'My Status',
        'Tap to add status update',
        'https://vignette.wikia.nocookie.net/clubpenguin/images/f/f3/Troll.png/revision/latest?cb=20121222001812',
        1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomWidgets.getBuddyStatusChild(mySelf, photoRadius: 24.0),
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
                CustomWidgets.getBuddyStatusChild(_status[index], isEnd: index == _status.length - 1),
          ),
        ),
      ],
    );
  }
}
