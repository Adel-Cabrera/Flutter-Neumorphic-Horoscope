import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphicbuttoni/src/provider/change_appbar_color.dart';
import 'package:neumorphicbuttoni/src/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    ChangeAppBarColor myCurrentColor = Provider.of<ChangeAppBarColor>(context);

    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('SAD'),
                decoration: BoxDecoration(),
              ),
              ListTile(
                trailing: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.library_books,
                  color: Colors.black,
                ),
                title: Text('Privacy Policy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                title: Text('Share App'),
                onTap: () {},
              ),
              ListTile(
                trailing: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                title: Text('Exit'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      /*appBar: AppBar(
        backgroundColor: myCurrentColor.baseColor,
        title: Text(
          'MyAppBar',
        ),
      ),*/
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NeumorphicButton(
              onClick: () {
                print("onClick");
              },
              style: NeumorphicStyle(shape: NeumorphicShape.convex),
              boxShape: NeumorphicBoxShape.circle(),
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.favorite_border,
                color: _iconsColor(context),
              ),
            ),
            NeumorphicButton(
              margin: EdgeInsets.only(top: 12),
              style: NeumorphicStyle(shape: NeumorphicShape.flat),
              boxShape: NeumorphicBoxShape.roundRect(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Toggle Theme",
                style: TextStyle(color: _textColor(context)),
              ),
              onClick: () {
                NeumorphicTheme.of(context).usedTheme =
                    NeumorphicTheme.isUsingDark(context)
                        ? UsedTheme.LIGHT
                        : UsedTheme.DARK;
                NeumorphicTheme.isUsingDark(context)
                    ? myCurrentColor.setBaseColor = Colors.red
                    : myCurrentColor.setBaseColor = Colors.blue;
              },
            ),
            NeumorphicButton(
              margin: EdgeInsets.only(top: 12),
              style: NeumorphicStyle(shape: NeumorphicShape.flat),
              boxShape: NeumorphicBoxShape.roundRect(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Go to full sample",
                style: TextStyle(
                  color: _textColor(context),
                ),
              ),
              onClick: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomCurvedNavBar(),
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
