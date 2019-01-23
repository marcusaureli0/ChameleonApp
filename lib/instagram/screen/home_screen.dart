import 'package:flutter/material.dart';

class InstagramHomeScreen extends StatefulWidget {
  @override
  _InstagramHomeScreenState createState() => _InstagramHomeScreenState();
}

class _InstagramHomeScreenState extends State<InstagramHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text('Instagram Home Scren'),
      ),
    );
  }
}
