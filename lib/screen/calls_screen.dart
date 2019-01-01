import 'package:flutter/material.dart';
import '../util/custom_wigets.dart';

class CallsScreen extends StatefulWidget {
  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
     return Container(
        child: Center(
            child: CustomWidgets.getTextWidget('CallsScreen'),
        ),
    );
  }
}