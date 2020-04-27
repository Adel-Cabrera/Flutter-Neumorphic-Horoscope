import 'package:deck_scrollview/deck_scroll_view.dart';
import 'package:deck_scrollview/deck_viewport.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flip_card/flip_card.dart';
import 'package:neumorphicbuttoni/src/pages/single_card_detail_page.dart';

class TarotPage extends StatefulWidget {
  @override
  _TarotPageState createState() => _TarotPageState();
}

class _TarotPageState extends State<TarotPage> {
  ScrollController controller;

  int myCount = 22;
  bool myBool = false;

  @override
  void initState() {
    super.initState();

    controller = ScrollController(
      initialScrollOffset: 10.0,
      keepScrollOffset: true,
    ); // NEW

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller
        ..animateTo(
          // NEW
          controller.position.maxScrollExtent, // NEW
          duration: const Duration(milliseconds: 500), // NEW
          curve: Curves.easeInOutCubic, // NEW
        );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 30.0,
            bottom: 50.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 150.0,
                width: 95.0,
                child: DragTarget(
                  onWillAccept: (val) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SingleCardDetailPage(),
                      ),
                    );
//                    Navigator.pushNamed(context, '/detail');

                    return true;
                  },
                  onAccept: (val) {},
                  builder: (context, accepted, rejected) {
                    return Hero(
                      tag: 'single_card_detail',
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9c0c74),
                          boxShadow: [
                            BoxShadow(blurRadius: 3, color: Color(0x44000000))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image(
                            fit: BoxFit.cover,
                            color: Colors.grey,
                            colorBlendMode: BlendMode.colorDodge,
                            image: AssetImage(
                              //'assets/images/back.jpeg',
                              'assets/images/tarotback.png',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: DeckScrollView.useDelegate(
                    layoutPow: 2.5,
                    itemExtent: 95,
                    controller: controller,
                    clipToSize: true,
                    childDelegate: DeckChildBuilderDelegate(
                      builder: (context, index) => Draggable(
                        maxSimultaneousDrags: 1,
                        //axis: Axis.vertical,
                        affinity: Axis.vertical,
                        onDragStarted: () {
                          setState(() {
//                            Future.delayed(Duration(milliseconds: 500))
//                                .then((onValue) => Navigator.of(context).push(
//                                      MaterialPageRoute(
//                                        builder: (_) => SingleCardDetailPage(),
//                                      ),
//                                    ));

                            myCount -= 1;
                            print(index);
                          });
                        },
                        onDraggableCanceled: (vel, off) {
                          setState(() {
                            myCount = 22;
                          });
                        },
                        onDragCompleted: () {
                          setState(() {
                            myCount -= 1;
                          });
                        },
                        childWhenDragging: Container(),
                        feedback: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(blurRadius: 3, color: Color(0x44000000))
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image(
                              width: 150.0,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                //'assets/images/back.jpeg',
                                'assets/images/tarotback.png',
                              ),
                            ),
                          ),
                        ),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF9c0c74),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3, color: Color(0x44000000))
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  //'assets/images/back.jpeg',
                                  'assets/images/tarotback.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      childCount: myCount,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
