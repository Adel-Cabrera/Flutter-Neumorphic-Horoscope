import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
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
              onClick: () {
                NeumorphicTheme.of(context).usedTheme =
                    NeumorphicTheme.isUsingDark(context)
                        ? UsedTheme.LIGHT
                        : UsedTheme.DARK;
              },
              style: NeumorphicStyle(shape: NeumorphicShape.flat),
              boxShape: NeumorphicBoxShape.roundRect(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Toggle Theme",
                style: TextStyle(color: _textColor(context)),
              ),
            ),
            NeumorphicButton(
                margin: EdgeInsets.only(top: 12),
                onClick: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return Container(); //FullSampleHomePage();
                  }));
                },
                style: NeumorphicStyle(shape: NeumorphicShape.flat),
                boxShape: NeumorphicBoxShape.roundRect(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Go to full sample",
                  style: TextStyle(color: _textColor(context)),
                )),
          ],
        ),
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
