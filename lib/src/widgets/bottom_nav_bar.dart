import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyBottomCurvedNavBar extends StatefulWidget {
  @override
  _MyBottomCurvedNavBarState createState() => _MyBottomCurvedNavBarState();
}

class _MyBottomCurvedNavBarState extends State<MyBottomCurvedNavBar> {
  int _page = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: <Widget>[
        Builder(
          builder: (context) => Container(
            child: Icon(
              Icons.ac_unit,
              size: 30,
              color: NeumorphicTheme.baseColor(context),
            ),
          ),
        ),
        Builder(
          builder: (context) => Container(
            child: Icon(
              Icons.account_box,
              size: 30,
              color: NeumorphicTheme.baseColor(context),
            ),
          ),
        ),
      ],
      color: NeumorphicTheme.defaultTextColor(context),
      buttonBackgroundColor: NeumorphicTheme.defaultTextColor(context),
      backgroundColor: NeumorphicTheme.baseColor(context),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }
}
