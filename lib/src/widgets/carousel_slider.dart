import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CarouselSigns extends StatefulWidget {
  @override
  _CarouselSignsState createState() => _CarouselSignsState();
}

enum Page { FIRST, SECOND }

class _CarouselSignsState extends State<CarouselSigns> {
  Page page;

  Map mySigns = {
    'Aries': 'March 21 - April 20',
    'Taurus': 'April 21 – May 21',
    'Gemini': 'May 22 – June 21',
    'Cancer': 'March 21 - April 20',
    'Leo': 'April 21 – May 21',
    'Virgo': 'May 22 – June 21',
    'Libra': 'March 21 - April 20',
    'Scorpio': 'April 21 – May 21',
    'Sagittarius': 'May 22 – June 21',
    'Capricorn': 'March 21 - April 20',
    'Aquarius': 'April 21 – May 21',
    'Pisces': 'May 22 – June 21',
  };

  static List<Widget> mySignsWidgets = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    createWidgets(Map mySigns) {
      mySigns.forEach(
        (k, v) {
          Widget singleSign = mySign('assets/images/ds.png', k, v);
          mySignsWidgets.add(singleSign);
        },
      );
    }

    createWidgets(mySigns);
  }

  Widget mySign(String image, String signName, String signDate) {
    return Builder(
      builder: (context) => Column(
        children: <Widget>[
          NeumorphicButton(
            child: Image(
              image: AssetImage(
                '$image',
              ),
              height: 30.0,
              width: 30.0,
            ),
            onClick: () {},
            boxShape: NeumorphicBoxShape.circle(),
            padding: EdgeInsets.all(
              20.0,
            ),
            style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                color: NeumorphicTheme.baseColor(context)),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '$signName',
            style: TextStyle(
              color: NeumorphicTheme.defaultTextColor(context),
              fontSize: 10.0,
            ),
          ),
          Text(
            '$signDate',
            style: TextStyle(
              color: NeumorphicTheme.defaultTextColor(context),
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }

  bool _indexWidget = false;
  static List list1 = mySignsWidgets.sublist(0, 3);
  static List list2 = mySignsWidgets.sublist(3, 6);
  static List list3 = mySignsWidgets.sublist(6, 9);
  static List list4 = mySignsWidgets.sublist(9, 12);

  static Widget _myAnimatedWidget = firstSix();

  static Widget firstSix() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: list1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: list2,
          )
        ],
      ),
    );
  }

  static Widget secondSix() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list4,
        ),
      ],
    );
  }

  bool myBool = true;

  @override
  Widget build(BuildContext context) {
    Widget myStack() {
      return AnimatedSwitcher(
        duration: Duration(
          seconds: 1,
        ),
        child: _myAnimatedWidget,
      );
    }

    return Column(
      children: <Widget>[
        myStack(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
                NeumorphicButton(
                  pressed: true,
                  isEnabled: false,
                  style: NeumorphicStyle(
                    color: myBool
                        ? NeumorphicTheme.variantColor(context)
                        : NeumorphicTheme.accentColor(context),
                    shape: myBool
                        ? NeumorphicShape.concave
                        : NeumorphicShape.convex,
                    depth: myBool ? 20 : -20,
                  ),
                  boxShape: NeumorphicBoxShape.circle(),
                  margin: EdgeInsets.only(
                    top: 20.0,
                  ),
                  onClick: () {},
                  child: Text(
                    '',
                  ),
                ),
                NeumorphicButton(
                  pressed: true,
                  isEnabled: false,
                  style: NeumorphicStyle(
                    color: myBool
                        ? NeumorphicTheme.accentColor(context)
                        : NeumorphicTheme.variantColor(context),
                    shape: myBool
                        ? NeumorphicShape.convex
                        : NeumorphicShape.concave,
                    depth: myBool ? -20 : 20,
                  ),
                  boxShape: NeumorphicBoxShape.circle(),
                  margin: EdgeInsets.only(
                    top: 20.0,
                  ),
                  onClick: () {},
                  child: Text(
                    '',
                  ),
                ),
              ],
            ),
            Spacer(),
            NeumorphicButton(
              margin: EdgeInsets.only(
                top: 20.0,
              ),
              onClick: () {
                setState(
                  () {
                    _indexWidget
                        ? _myAnimatedWidget = firstSix()
                        : _myAnimatedWidget = secondSix();
                    _indexWidget = !_indexWidget;
                    myBool = !myBool;
                  },
                );
              },
              child: Row(
                children: <Widget>[
                  myBool
                      ? Text('')
                      : Icon(
                          Icons.navigate_before,
                        ),
                  Text(
                    'HW',
                    style: TextStyle(
                      color: _textColor(context),
                    ),
                  ),
                  myBool
                      ? Icon(
                          Icons.navigate_next,
                        )
                      : Text(''),
                ],
              ),
            ),
          ],
        ),
      ],
    );
    /*CarouselSlider(
      height: MediaQuery.of(context).size.height * 0.4,
      enableInfiniteScroll: false,
      items: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: mySignsWidgets,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: mySignsWidgets,
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: mySignsWidgets,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: mySignsWidgets,
            )
          ],
        )
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return i;
          },
        );
      }).toList(),
    );*/

    /*Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: mySignsWidgets,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: mySignsWidgets,
        )
      ],
    );*/
  }
}

/*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[mySign(), mySign(), mySign()],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[mySign(), mySign(), mySign()],
                  ),

*/
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
