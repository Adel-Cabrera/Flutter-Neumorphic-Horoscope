import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CarouselSigns extends StatefulWidget {
  @override
  _CarouselSignsState createState() => _CarouselSignsState();
}

class _CarouselSignsState extends State<CarouselSigns> {
  Map mySigns = {
    'Aries': 'March 21 - April 20',
    'Taurus': 'April 21 – May 21',
    'Gemini': 'May 22 – June 21',
    'Cancer': 'June 22 – July 22',
    'Leo': 'July 23 – Aug 23',
    'Virgo': 'Aug 24 – Sep 22',
    'Libra': 'Sep 23 – Oct 23',
    'Scorpio': 'Oct 24 – Nov 22',
    'Sagittarius': 'Nov 23 – Dec 21',
    'Capricorn': 'Dec 22 – Jan 20',
    'Aquarius': 'Jan 21 – Feb 18',
    'Pisces': 'Feb 19 - March 20',
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
  bool myBool = true;

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
          SizedBox(
            height: 10.0,
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
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list4,
        ),
      ],
    );
  }

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
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  isEnabled: false,
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.baseColor(context),
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
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.baseColor(context),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  myBool
                      ? Text('')
                      : Builder(
                          builder: (context) => Icon(
                            Icons.navigate_before,
                            color: _textColor(context),
                          ),
                        ),
                  myBool
                      ? Text(
                          'Next',
                          style: TextStyle(
                            color: _textColor(context),
                          ),
                        )
                      : Text(
                          'Prev',
                          style: TextStyle(
                            color: _textColor(context),
                          ),
                        ),
                  myBool
                      ? Builder(
                          builder: (context) => Icon(
                            Icons.navigate_next,
                            color: _textColor(context),
                          ),
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
