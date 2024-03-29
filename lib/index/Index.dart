import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import 'package:flutter_zhihu/home/HomePage.dart';
import 'package:flutter_zhihu/idea/IdeaPage.dart';
import 'package:flutter_zhihu/market/MarketPage.dart';
import 'package:flutter_zhihu/notice/NoticePage.dart';
import 'package:flutter_zhihu/my/MyPage.dart';
import 'package:flutter_zhihu/global_config.dart';

class Index extends StatefulWidget {
  @override
  State createState() {
    return new _IndexState();
  }
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    super.initState();

    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assessment),
        title: new Text('首页'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.all_inclusive),
        title: new Text('想法'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.add_shopping_cart),
        title: new Text('市场'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.add_alert),
        title: new Text('通知'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.perm_identity),
        title: new Text('我的'),
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MarketPage(),
      new NoticePage(),
      new MyPage()
    ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: GlobalConfig.themeData,
    );
  }
}
