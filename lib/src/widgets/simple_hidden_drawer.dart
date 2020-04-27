import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:neumorphicbuttoni/src/pages/home_page.dart';
import 'package:neumorphicbuttoni/src/pages/prueba.dart';
import 'package:neumorphicbuttoni/src/pages/tarot_page.dart';
import 'package:neumorphicbuttoni/src/provider/change_current_page_btmnavbar.dart';
import 'package:neumorphicbuttoni/src/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import 'hidden_menu.dart';

class SimpleHidden extends StatefulWidget {
  @override
  _SimpleHiddenState createState() => _SimpleHiddenState();
}

class _SimpleHiddenState extends State<SimpleHidden> {
  @override
  Widget build(BuildContext context) {
    ChangeCurrentPage _changePage = Provider.of<ChangeCurrentPage>(context);

    return SimpleHiddenDrawer(
      curveAnimation: Curves.decelerate,
      isDraggable: true,
      enableScaleAnimin: true,
      enableCornerAnimin: true,
      verticalScalePercent: 78.0,
      slidePercent: 78.0,
      contentCornerRadius: 30.0,
      menu: Menu(),
      screenSelectedBuilder: (position, controller) {
        Widget screenCurrent;

        switch (position) {
          case 0:
            screenCurrent = HomePage();
            _changePage.setCurrentPage = screenCurrent;
            _changePage.setPageIndex = 0;
            break;
          case 1:
            screenCurrent = TarotPage();
            _changePage.setCurrentPage = screenCurrent;
            _changePage.setPageIndex = 1;

            break;
          case 2:
            screenCurrent = MyHomePage();
            _changePage.setCurrentPage = screenCurrent;

            break;
        }

        return MyScaffold(
          controller: controller,
          screenCurrent: screenCurrent,
        );
      },
    );
  }
}

class MyScaffold extends StatefulWidget {
  final controller;
  final screenCurrent;

  MyScaffold({this.controller, this.screenCurrent});

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    ChangeCurrentPage _changePage = Provider.of<ChangeCurrentPage>(context);

    return StatefulBuilder(
      builder: (context, setState) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Premium Horoscope',
            ),
            backgroundColor: NeumorphicTheme.baseColor(context),
            leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: _iconsColor(context),
                ),
                onPressed: () {
                  widget.controller.toggle();
                }),
          ),
          body: _changePage.currentPage,
          bottomNavigationBar: MyBottomCurvedNavBar(),
        ),
      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.defaultTextColor;
    } else {
      return theme.current.defaultTextColor;
    }
  }
}
