import 'package:chameleonapp/assets_controller.dart';
import 'package:chameleonapp/netflix/model/options_model.dart';
import 'package:flutter/material.dart';

class NetflixHomeScreen extends StatefulWidget {
  @override
  _NetflixHomeScreenState createState() => _NetflixHomeScreenState();
}

List<PopupMenuItem> _getPopupItems() {
  List<PopupMenuItem> items = [];
  items.add(
    new PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
    ),
  );
  items.add(
    new PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.share),
        title: Text('Share'),
      ),
    ),
  );

  return items;
}

class _NetflixHomeScreenState extends State<NetflixHomeScreen> {
  var currentPage = 0;

  Widget _getAppBar() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Material(
          color: Color.fromRGBO(28, 36, 41, 0.8),
          child: Padding(
              padding: EdgeInsets.only(
                  left: 8.0, top: 30.0, right: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Netflix',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red[600],
                            fontWeight: FontWeight.w300,
                            fontSize: 28.0,
                            letterSpacing: 4.0,
                            fontFamily: 'Anton'),
                      ),
                    ),
                  ),
                  Container(
                    child: PopupMenuButton(
                      tooltip: 'More options',
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      itemBuilder: (context) => _getPopupItems(),
                    ),
                  ),
                ],
              ))),
    );
  }

  BottomNavigationBar _getBottomBar() {
    return /*Positioned(
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: */
        BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //fixedColor: Color.fromRGBO(28, 36, 41, 0.8),
      items: _getBottomNavigationBarItems(),
      //),
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    List<OptionsModel> barItems = [];
    barItems.add(OptionsModel(title: 'Início', icon: Icons.home));
    barItems.add(OptionsModel(title: 'Buscar', icon: Icons.home));
    barItems.add(OptionsModel(title: 'Em breve', icon: Icons.home));
    barItems.add(OptionsModel(title: 'Downloads', icon: Icons.home));
    barItems.add(OptionsModel(title: 'Mais', icon: Icons.home));

    return List<BottomNavigationBarItem>.generate(
        barItems.length,
        (index) => new BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              barItems[index].icon,
              color: index == currentPage ? Colors.white : Colors.grey[100],
              size: 18.0,
            ),
            title: Text(barItems[index].title,
                style: TextStyle(
                    fontSize: 13,
                    color: index == currentPage
                        ? Colors.white
                        : Colors.grey[100]))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: Material(
        color: Colors.red,
        child: _getBottomBar(),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Image.asset(
                AssetsController().getImageDirectory(AssetsType.NetflixIcon),
                width: 20.0,
                height: 20.0,
              ),
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.75),
              //expandedHeight: 200.0,
              floating: false,
              pinned: false,
              /*flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      '',
                      style:
                          TextStyle(color: Colors.red[600], letterSpacing: 4.0),
                    ),
                    background: Image.network(
                        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
                        fit: BoxFit.cover),
                  ),*/
            ),
          ];
        },
        body: Stack(
          children: <Widget>[
            //_getAppBar(),
            Center(
              child: Text(
                'Netflix',
                style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.red[800],
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Anton',
                    letterSpacing: 3.0),
              ),
            ),
          ],
        ),
      ),
    );

    /*Stack(
      children: <Widget>[
        _getAppBar(),
        Center(
          child: Text(
            'Netflix',
            style: new TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontFamily: 'Anton',
                letterSpacing: 3.0),
          ),
        ),
        _getBottomBar(),
      ],
    );*/
  }
}
