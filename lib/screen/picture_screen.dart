import 'package:flutter/material.dart';
import '../util/custom_wigets.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:async';

typedef Compare<T> = int Function(T a, T b);

class PictureScreen extends StatefulWidget {
  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  // Future showCamera() async {
  //   await ImagePicker.pickImage(
  //     source: ImageSource.camera,
  //   );
  // }

  int sort(int a, int b) => a - b;

  @override
  void initState() {
    super.initState();

    var result = sort is Compare<String> ? 'true' : 'false';
    print('compared $result');
    //showCamera();
    //  _showCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomWidgets.getTextWidget('PictureScreen'),
      ),
    );
  }
}
