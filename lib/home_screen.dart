import 'dart:math' as math;
import 'package:chameleonapp/assets_controller.dart';
import 'package:chameleonapp/instagram/screen/home_screen.dart';
import 'package:chameleonapp/netflix/screen/home_screen.dart';
import 'package:chameleonapp/under_development_screen.dart';
import 'package:chameleonapp/whatsapp/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<AppData> items;
  Color _bodyColor;
  PageController _pageController;
  bool _waitingScreen;

  @override
  void initState() {
    _bodyColor = _getRandomColor();
    _waitingScreen = false;
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
    _updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: _bodyColor,
              floating: true,
              pinned: true,
              titleSpacing: 3.0,
              expandedHeight: 280.0,
              elevation: 1.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('ChameleonApp'),
                collapseMode: CollapseMode.parallax,
                background: Image.asset(
                  AssetsController().getImageDirectory(AssetsType.Chameleon),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: SafeArea(
          child: _buildCarousel(context, items),
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, List<AppData> items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 230.0,
          child: PageView.builder(
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
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: InkWell(
          onTap: () {
            _openScreen(item.appType);
          },
          splashColor: Colors.blueAccent[50],
          highlightColor: Colors.teal.withOpacity(0.1),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 20.0,
                  color: Colors.black12,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Image(image: NetworkImage(item.imageUrl), height: 150.0),
                Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                Text(item.name,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w400)),
                Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                Text('open ${item.name} app',
                    style: TextStyle(color: Colors.black54))
              ],
            ),
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

  Future<void> _openScreen(AppType appType) async {
    if (!_waitingScreen) {
      _waitingScreen = true;
      await Future.delayed(Duration(milliseconds: 100)).then((result) {
        Widget screen;
        switch (appType) {
          case AppType.Instagram:
            screen = InstagramHomeScreen();
            break;
          case AppType.Whatsapp:
            screen = WhatsappHomeScreen();
            break;
          case AppType.Netflix:
            screen = NetflixHomeScreen();
            break;
          default:
            screen = UnderDevelopmentScreen();
        }
        screen != null
            ? Navigator.push(
                context, CupertinoPageRoute(builder: (context) => screen))
            : Scaffold.of(context)
                .showSnackBar(SnackBar(content: new Text('Under Development')));
      });
      _waitingScreen = false;
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}

class AnimatedItem extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    return null;
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
