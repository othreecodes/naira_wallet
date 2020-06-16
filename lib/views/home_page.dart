import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nairawallet/theme/styles.dart';
import 'package:nairawallet/views/home_tabs/home.dart';
import 'package:nairawallet/views/home_tabs/news.dart';
import 'package:nairawallet/views/home_tabs/settings.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with RouteAware {
  int _currentIndex = 0;

  final tabs = [
    HomeTab(),
    NewsTab(),
    SettingsTab(),
  ];

  @override
  void didPopNext() {
    super.didPopNext();
    setState(() {
      _currentIndex = 1;
    });
 ////    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
//    StatusBar.color(colorPrimary);
//    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
//    FlutterStatusbarcolor.setStatusBarColor(colorPrimary);
  }
 
 
  @override
  Widget build(BuildContext context) {
 
    print("building");
    return Scaffold(
      backgroundColor: colorPrimary,
      body: AnnotatedRegion<SystemUiOverlayStyle>(value: SystemUiOverlayStyle.light.copyWith( statusBarColor: colorPrimary,),child: tabs[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorPrimary,
        selectedItemColor: Colors.white,
        unselectedItemColor: colorAccentDark,
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
              icon: Icon(Entypo.wallet),
              title: Text(
                "Home",
                style: bold,
              ),
              backgroundColor: colorPrimary),
          BottomNavigationBarItem(
              icon: Icon(Entypo.rss),
              title: Text(
                "News",
                style: bold,
              ),
              backgroundColor: colorPrimary),
          BottomNavigationBarItem(
              icon: Icon(Entypo.cog),
              title: Text(
                "Settings",
                style: bold,
              ),
              backgroundColor: colorPrimary),
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
