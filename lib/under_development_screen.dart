import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Development', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Center(
          child: Text('Under Development',
              style: TextStyle(color: Colors.black54, fontSize: 18.0)),
        ),
      ),
    );
  }
}
