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
    List<ScreenHiddenDrawer> mynewList = [
      ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle: TextStyle(
              color: NeumorphicTheme.baseColor(context), fontSize: 28.0),
          colorLineSelected: NeumorphicTheme.accentColor(context),
        ),
        HomePage(),
      ),
    ];

    return MyHidden(
      myColor: Provider.of<ChangeAppBarColor>(context).baseColor,
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

class MyHidden extends StatefulWidget {
  final Color myColor;

  MyHidden({this.myColor});

  @override
  _MyHiddenState createState() => _MyHiddenState();
}

class _MyHiddenState extends State<MyHidden> {
  @override
  Widget build(BuildContext context) {
    List<ScreenHiddenDrawer> mynewList = [
      ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle: TextStyle(
              color: NeumorphicTheme.baseColor(context), fontSize: 28.0),
          colorLineSelected: NeumorphicTheme.accentColor(context),
        ),
        HomePage(),
      ),
    ];

    Color _baseColor(BuildContext context) {
      final theme = NeumorphicTheme.of(context);

      if (theme.isUsingDark) {
        // return Colors.white;
        //print('My current color is ${myCurrentColor.baseColor}');

        return theme.current.baseColor;
      } else {
        // return Colors.black;
        //print('My current color is ${myCurrentColor.baseColor}');

        return theme.current.baseColor;
      }
    }

    return MyHiddenMenu(
      myColor: widget.myColor,
    );
    //    typeOpen: TypeOpen.FROM_RIGHT,
    //    enableScaleAnimin: true,
    //    enableCornerAnimin: true,
    //    slidePercent: 80.0,
    //    verticalScalePercent: 80.0,
    //    contentCornerRadius: 10.0,
    //    iconMenuAppBar: Icon(Icons.menu),
    //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
    //    whithAutoTittleName: true,
    //    styleAutoTittleName: TextStyle(color: Colors.red),
    //    actionsAppBar: <Widget>[],
    //    backgroundColorContent: Colors.blue,
    //    elevationAppBar: 4.0,
    //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
    //    enableShadowItensMenu: true,
    //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
  }
}

class MyHiddenMenu extends StatelessWidget {
  Color myColor;

  MyHiddenMenu({this.myColor});

  @override
  Widget build(BuildContext context) {
    print('MyColor is $myColor');

    List<ScreenHiddenDrawer> mynewList = [
      ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle: TextStyle(
              color: NeumorphicTheme.baseColor(context), fontSize: 28.0),
          colorLineSelected: NeumorphicTheme.accentColor(context),
        ),
        HomePage(),
      ),
    ];

    return HiddenDrawerMenu(
        backgroundColorAppBar: myColor,
        backgroundColorMenu: myColor,
        screens: mynewList);
  }
}
