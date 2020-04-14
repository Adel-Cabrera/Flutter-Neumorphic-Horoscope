import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:neumorphicbuttoni/src/pages/home_page.dart';

import 'hidden_menu.dart';

class SimpleHidden extends StatefulWidget {
  @override
  _SimpleHiddenState createState() => _SimpleHiddenState();
}

class _SimpleHiddenState extends State<SimpleHidden> {
  @override
  Widget build(BuildContext context) {
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
            break;
          case 1:
            screenCurrent = HomePage();
            break;
          case 2:
            screenCurrent = HomePage();
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
    return StatefulBuilder(
      builder: (context, setState) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Page ${widget.screenCurrent}',
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
          body: widget.screenCurrent,
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
