import 'package:deck_scrollview/deck_scroll_view.dart';
import 'package:deck_scrollview/deck_viewport.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TarotPage extends StatefulWidget {
  @override
  _TarotPageState createState() => _TarotPageState();
}

class _TarotPageState extends State<TarotPage> {
  ScrollController controller;

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
          curve: Curves.ease, // NEW
        );
    });
  }

  int myCount = 22;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30.0),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: RotatedBox(
                quarterTurns: 1,
                child: DeckScrollView.useDelegate(
                  layoutPow: 5.0,
                  controller: controller,
                  clipToSize: false,
                  itemExtent: 175,
                  renderChildrenOutsideViewport: false,
                  childDelegate: DeckChildBuilderDelegate(
                    builder: (context, index) => LongPressDraggable(
                      onDragStarted: () {
                        setState(() {
                          myCount -= 1;
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
                      feedback: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
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
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/back.jpeg',
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        width: 300.0,
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
                            fit: BoxFit.scaleDown,
                            image: AssetImage(
                              'assets/images/back.jpeg',
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
          ),
          RaisedButton(
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
