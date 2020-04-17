import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TarotPage extends StatefulWidget {
  @override
  _TarotPageState createState() => _TarotPageState();
}

class _TarotPageState extends State<TarotPage> {
  @override
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
                child: Swiper(
                    layout: SwiperLayout.CUSTOM,
                    customLayoutOption:
                        new CustomLayoutOption(startIndex: 0, stateCount: 22)
                            .addTranslate([
                      new Offset(-200.0, 20.0),
                      new Offset(-180.0, 19.0),
                      new Offset(-160.0, 18.0),
                      new Offset(-140.0, 17.0),
                      new Offset(-120.0, 16.0),
                      new Offset(-100.0, 15.0),
                      new Offset(-80.0, 14.0),
                      new Offset(-60.0, 13.0),
                      new Offset(-40.0, 12.0),
                      new Offset(-20.0, 11.0),
                      new Offset(0.0, 0.0),
                      new Offset(20.0, 10.0),
                      new Offset(40.0, 11.0),
                      new Offset(60.0, 12.0),
                      new Offset(80.0, 13.0),
                      new Offset(100.0, 14.0),
                      new Offset(120.0, 15.0),
                      new Offset(140.0, 16.0),
                      new Offset(160.0, 17.0),
                      new Offset(180.0, 18.0),
                      new Offset(200.0, 19.0),
                      new Offset(220.0, 20.0),
                    ]),
                    itemWidth: 30.0,
                    itemHeight: 50.0,
                    itemBuilder: (context, index) {
                      return Draggable(
                        feedback: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.red),
                          child: Center(
                            child: Text("$index"),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.red),
                          child: Center(
                            child: Text("$index"),
                          ),
                        ),
                      );
                    },
                    itemCount: 22),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
