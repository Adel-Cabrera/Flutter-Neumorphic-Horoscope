import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphicbuttoni/src/widgets/bottom_nav_bar.dart';
import 'package:neumorphicbuttoni/src/widgets/carousel_slider.dart';
import 'package:neumorphicbuttoni/src/widgets/elements_signs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Neumorphic(
                margin: EdgeInsets.all(
                  15.0,
                ),
                padding: EdgeInsets.all(
                  15.0,
                ),
                boxShape: NeumorphicBoxShape.roundRect(
                  borderRadius: BorderRadius.circular(8),
                ),
                style: NeumorphicStyle(
                  intensity: NeumorphicTheme.intensity(context),
                  shape: NeumorphicShape.flat,
                  depth: NeumorphicTheme.depth(context),
                  lightSource: NeumorphicTheme.of(context).current.lightSource,
                  color: NeumorphicTheme.baseColor(context),
                ),
                child: CarouselSigns(),
              ),
              SizedBox(
                height: 30.0,
              ),
              MyElementsSigns(),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.baseColor;
    } else {
      return theme.current.baseColor;
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

/*Center(
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
                style: TextStyle(
                  color: _textColor(context),
                ),
              ),
              onClick: () {
                NeumorphicTheme.of(context).usedTheme =
                    NeumorphicTheme.isUsingDark(context)
                        ? UsedTheme.LIGHT
                        : UsedTheme.DARK;
              },
            ),
          ],
        ),
      ),*/
