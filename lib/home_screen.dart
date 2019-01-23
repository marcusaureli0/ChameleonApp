import 'dart:math' as math;
import 'package:chameleonapp/under_development_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chameleonapp/whatsapp/screen/whatsapp_home_screen.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AppData> items;
  Color _bodyColor;
  int _animationDur; // in ms
  PageController _pageController;

  @override
  void initState() {
    _bodyColor = Colors.white; //_getRandomColor();
    _animationDur = 3;
    _pageController =
        PageController(viewportFraction: 0.5, initialPage: 1, keepPage: false);
    items = [
      AppData(
          name: 'Whatsapp',
          imageUrl:
              'https://i0.wp.com/www.smartparent.in/wp-content/uploads/2018/06/Whatsapp-Icon.png',
          appType: AppType.Whatsapp),
      AppData(
          name: 'Instagram',
          imageUrl:
              'http://dudurochatec.com.br/wp-content/uploads/2018/08/Instagram-logo.png',
          appType: AppType.Instagram),
      AppData(
          name: 'Netflix',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png',
          appType: AppType.Netflix)
    ];

    super.initState();

    // _updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('ChamaleonApp'),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: _animationDur),
        color: _bodyColor,
        curve: Curves.easeIn,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, i) {
              return _buildCarousel(context, items);
            }),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, List<AppData> items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Choose one App',
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 230.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: _pageController,
            pageSnapping: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(items[itemIndex]);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(AppData item) {
    return GestureDetector(
      onTap: () {
        _openScreen(item.appType);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 12.0)),
              Image(image: NetworkImage(item.imageUrl), height: 150.0),
              Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              Text(item.name, style: TextStyle(color: Colors.black87)),
              Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              Text('open ${item.name} app',
                  style: TextStyle(color: Colors.black54))
            ],
          ),
        ),
      ),
    );
  }

  Color _getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(0.25);
  }

  Future _updateState() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _bodyColor = _getRandomColor();
    });

    _updateState();
  }

  void _openScreen(AppType appType) {
    Widget screen;
    switch (appType) {
      case AppType.Instagram:
        screen = UnderDevelopmentScreen();
        break;
      case AppType.Whatsapp:
        screen = WhatsappHomeScreen();
        break;
      case AppType.Netflix:
        screen = UnderDevelopmentScreen();
        break;
      default:
        screen = UnderDevelopmentScreen();
    }
    screen != null
        ? Navigator.push(
            context, CupertinoPageRoute(builder: (context) => screen))
        : Scaffold.of(context)
            .showSnackBar(SnackBar(content: new Text('Under Development')));
  }
}

enum AppType { Whatsapp, Instagram, Netflix }

class AppData {
  String name;
  String imageUrl;
  AppType appType;

  AppData(
      {@required this.name, @required this.imageUrl, @required this.appType});
}
