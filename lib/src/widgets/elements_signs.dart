import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyElementsSigns extends StatefulWidget {
  @override
  _MyElementsSignsState createState() => _MyElementsSignsState();
}

class _MyElementsSignsState extends State<MyElementsSigns> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NeumorphicButton(
              child: Image(
                image: AssetImage(
                  'assets/images/ds.png',
                ),
                height: 50.0,
                width: 50.0,
              ),
              onClick: () {},
              boxShape: NeumorphicBoxShape.roundRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(
                50.0,
              ),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: NeumorphicTheme.baseColor(context)),
            ),
            NeumorphicButton(
              child: Image(
                image: AssetImage(
                  'assets/images/ds.png',
                ),
                height: 50.0,
                width: 50.0,
              ),
              onClick: () {},
              boxShape: NeumorphicBoxShape.roundRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(
                50.0,
              ),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: NeumorphicTheme.baseColor(context)),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NeumorphicButton(
              child: Image(
                image: AssetImage(
                  'assets/images/ds.png',
                ),
                height: 50.0,
                width: 50.0,
              ),
              onClick: () {},
              boxShape: NeumorphicBoxShape.roundRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(
                50.0,
              ),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: NeumorphicTheme.baseColor(context)),
            ),
            NeumorphicButton(
              child: Image(
                image: AssetImage(
                  'assets/images/ds.png',
                ),
                height: 50.0,
                width: 50.0,
              ),
              onClick: () {},
              boxShape: NeumorphicBoxShape.roundRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(
                50.0,
              ),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: NeumorphicTheme.baseColor(context)),
            ),
          ],
        ),
      ],
    );
  }
}
