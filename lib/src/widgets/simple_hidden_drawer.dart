import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
      builder: (context, setState) => Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: NeumorphicTheme.baseColor(context),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                widget.controller.toggle();
              }),
        ),
        body: widget.screenCurrent,
      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.accentColor;
    } else {
      return theme.current.accentColor;
    }
  }

  Color _textColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);

    if (NeumorphicTheme.isUsingDark(context)) {
      // return Colors.white;
      return theme.current.defaultTextColor;
    } else {
      // return Colors.black;
      return theme.current.defaultTextColor;
    }
  }
}
