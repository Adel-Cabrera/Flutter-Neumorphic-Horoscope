import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

//
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:neumorphicbuttoni/src/pages/home_page.dart';
import 'package:neumorphicbuttoni/src/provider/change_appbar_color.dart';
import 'package:provider/provider.dart';
//

class MyHiddenDrawer extends StatefulWidget {
  @override
  _MyHiddenDrawerState createState() => _MyHiddenDrawerState();
}

class _MyHiddenDrawerState extends State<MyHiddenDrawer> {
  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(
      new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle: TextStyle(
              color: NeumorphicTheme.baseColor(context), fontSize: 28.0),
          colorLineSelected: NeumorphicTheme.variantColor(context),
        ),
        HomePage(),
      ),
    );

    items.add(
      new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 2",
          baseStyle: TextStyle(
              color: NeumorphicTheme.baseColor(context), fontSize: 28.0),
          colorLineSelected: NeumorphicTheme.variantColor(context),
        ),
        HomePage(),
      ),
    );

    super.initState();
  }

  Color _baseColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);

    if (theme.isUsingDark) {
      // return Colors.white;
      print(theme.current.baseColor);
      return theme.current.baseColor;
    } else {
      // return Colors.black;
      print(theme.current.baseColor);

      return theme.current.baseColor;
    }
  }

  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorAppBar: _baseColor(context),
      backgroundColorMenu: _baseColor(context),
      screens: items,
    );
  }
}
