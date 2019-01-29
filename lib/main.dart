import 'package:chameleonapp/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chameleonapp/whatsapp/screen/settings_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/settings': (context) => SettingsScreen()
      },
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
        platform: TargetPlatform.iOS,
      ),
      home: new HomeScreen(),
    );
  }
}
