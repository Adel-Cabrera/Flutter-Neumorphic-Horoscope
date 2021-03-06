import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: NeumorphicTheme.baseColor(context),
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                SimpleHiddenDrawerProvider.of(context)
                    .setSelectedMenuPosition(0);
              },
              child: Text("Home Page"),
            ),
            RaisedButton(
              onPressed: () {
                SimpleHiddenDrawerProvider.of(context)
                    .setSelectedMenuPosition(1);
              },
              child: Text("Tarot Page"),
            ),
            RaisedButton(
              onPressed: () {
                SimpleHiddenDrawerProvider.of(context)
                    .setSelectedMenuPosition(2);
              },
              child: Text("Prueba Page"),
            ),
            RaisedButton(
              child: Text(
                'Change theme',
              ),
              onPressed: () {
                NeumorphicTheme.of(context).usedTheme =
                    NeumorphicTheme.isUsingDark(context)
                        ? UsedTheme.LIGHT
                        : UsedTheme.DARK;
                SimpleHiddenDrawerProvider.of(context).toggle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
