import 'package:flutter/material.dart';
import '../util/custom_wigets.dart';

class PictureScreen extends StatefulWidget {
  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: CustomWidgets.getTextWidget('PictureScreen'),
        ),
    );
  }
}