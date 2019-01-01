import 'package:flutter/material.dart';
import './calls_screen.dart';
import './chat_screen.dart';
import './status_screen.dart';
import './picture_screen.dart';
import '../model/post_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Future<Post> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp', style: TextStyle(color: Colors.white)),
        elevation: 1.0,
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: <Widget>[
            Container(width: 20.0, child: Tab(icon: Icon(Icons.camera_alt))),
            Tab(text: "CHATS"),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(padding: EdgeInsets.symmetric(horizontal: 9.0)),
          Icon(Icons.more_vert),
          Padding(
            padding: EdgeInsets.only(right: 9.0),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PictureScreen(),
          ChatScreen(),
          StatusScreen(post: fetchPost()),
          CallsScreen(),
        ],
      ),
    );
  }
}
