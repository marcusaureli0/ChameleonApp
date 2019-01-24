import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InstagramHomeScreen extends StatefulWidget {
  @override
  _InstagramHomeScreenState createState() => _InstagramHomeScreenState();
}

List<Widget> _getHomeActions() {
  var icons = [Icons.live_tv, Icons.send];
  return List<Widget>.generate(
      2,
      (index) => IconButton(
            icon: Icon(icons[index], color: Colors.black, size: 30.0),
            onPressed: () {},
          ));
}

List<BottomNavigationBarItem> _getBottomNavigationBarItem() {
  var icons = [Icons.home, Icons.search, Icons.add_box, Icons.favorite_border, Icons.person_outline];

  return List<BottomNavigationBarItem>.generate(5, (index) => BottomNavigationBarItem(
    icon: Icon(icons[index], color: Colors.black, size: 30.0),
    backgroundColor: Colors.grey[100],
    title: Text('')
  ));
}

class _InstagramHomeScreenState extends State<InstagramHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.black87, size: 30.0),
              onPressed: () {},
            ),
            title: Text('Instagram',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Billabong',
                    fontSize: 28.0)),
            backgroundColor: Colors.white,
            elevation: 1.0,
            actions: _getHomeActions()),
        body: Center(
          child: Text('Instagram Home Screen'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: _getBottomNavigationBarItem(),
        ));
  }
}
