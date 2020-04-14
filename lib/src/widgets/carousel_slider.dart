import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  };

  List<Widget> mySignsWidgets = [];

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

  int _indexWidget = 1;

  Widget myStack() {
    return IndexedStack(
      index: _indexWidget,
      children: <Widget>[
        Column(
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
        Column(
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        myStack(),
        RaisedButton(
          onPressed: () {
            setState(() {
              _indexWidget == 0 ? _indexWidget = 1 : _indexWidget = 0;
            });
          },
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
