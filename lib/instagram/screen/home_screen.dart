import 'package:chameleonapp/instagram/screen/activity_history.dart';
import 'package:chameleonapp/instagram/screen/friends_feed.dart';
import 'package:chameleonapp/instagram/screen/gallery.dart';
import 'package:chameleonapp/instagram/screen/person_page.dart';
import 'package:chameleonapp/instagram/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class InstagramHomeScreen extends StatefulWidget {
  @override
  _InstagramHomeScreenState createState() => _InstagramHomeScreenState();
}

class _InstagramHomeScreenState extends State<InstagramHomeScreen> {
  var _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.black87, size: 30.0),
            onPressed: () {},
          ),
          title: Text(
            'Instagram',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Billabong', fontSize: 28.0),
          ),
          backgroundColor: Colors.white,
          elevation: 1.0,
          actions: _getHomeActions()),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: /*ListView(
          children: <Widget>[*/
            _mTabs[_currentTab],
        //  ],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentTab,
        type: BottomNavigationBarType.fixed,
        items: _getBottomNavigationBarItems(),
      ),
    );
  }

  List<Widget> _mTabs = [
    ActivityHistoryScreen(),
    FriendsFeedScreen(),
    GalleryScreen(),
    PersonPageScreen(),
    SearchScreen(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentTab = index;
    });
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

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    var icons = [
      Icons.home,
      Icons.search,
      Icons.add_box,
      Icons.favorite_border,
      Icons.person_outline
    ];

    return List<BottomNavigationBarItem>.generate(
      icons.length,
      (index) => BottomNavigationBarItem(
            activeIcon: Icon(
              icons[index],
              color: Colors.black,
            ),
            icon: Icon(icons[index], color: Colors.black54, size: 30.0),
            backgroundColor: Colors.grey[100],
            label:'',
          ),
    );
  }

  List<dynamic> _getHistories() {}

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // handle update
      });
    });

    return null;
  }
}
