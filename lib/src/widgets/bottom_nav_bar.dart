import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphicbuttoni/src/pages/home_page.dart';
import 'package:neumorphicbuttoni/src/pages/home_page.dart';
import 'package:neumorphicbuttoni/src/pages/tarot_page.dart';
import 'package:neumorphicbuttoni/src/provider/change_current_page_btmnavbar.dart';
import 'package:provider/provider.dart';

class MyBottomCurvedNavBar extends StatefulWidget {
  @override
  _MyBottomCurvedNavBarState createState() => _MyBottomCurvedNavBarState();
}

class _MyBottomCurvedNavBarState extends State<MyBottomCurvedNavBar> {
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  int _page = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  final HomePage _homePage = HomePage();
  final TarotPage _tarotPage = TarotPage();

  Widget showPage = HomePage();

  Widget _choosePage(int page) {
    switch (page) {
      case 0:
        return _homePage;
      case 1:
        return _tarotPage;
        break;
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    ChangeCurrentPage _currentPage = Provider.of<ChangeCurrentPage>(context);

    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: _currentPage.pageIndex,
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
      onTap: (int tappedIndex) {
        setState(() {
          _page = tappedIndex;
          _currentPage.setPageIndex = _page;
          showPage = _choosePage(tappedIndex);
          _currentPage.setCurrentPage = _choosePage(tappedIndex);
        });
      },
    );
  }
}
