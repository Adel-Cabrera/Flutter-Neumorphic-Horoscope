import 'package:flutter/material.dart';

/// NOT USING
// import 'package:circle_wheel_scroll/circle_wheel_render.dart';
//import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
// circle_wheel_scroll: ^0.0.1+1
/// NOT USING

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

int myIndex = 0;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

PageController controller = PageController();
var currentPageValue = 0.0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, position) {},
      itemCount: 10,
    );
  }
}

/*
return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: RotatedBox(
            quarterTurns: 3,
            child: CircleListScrollView(
              radius: 170.0,
              clipToSize: false,
              axis: Axis.vertical,
              itemExtent: 70,
              children: List.generate(22, _buildItem),
              onSelectedItemChanged: (int index) {
                print('Current index: $myIndex');
                setState(() {
                  myIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(int i) {
  return Draggable(
    feedback: Container(
      color: Colors.green,
      width: 300.0,
      height: 300.0,
    ),
    childWhenDragging: Container(
      color: Colors.green,
      width: 300.0,
      height: 300.0,
    ),
    child: Transform.translate(
      offset: i == myIndex
          ? Offset(
              40,
              0,
            )
          : Offset(
              0,
              0,
            ),
      child: Transform.scale(
        scale: 1.3,
        child: Container(
          color: Color(0xFF9c0c74),
          padding: EdgeInsets.all(2.0),
          child: Image(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              'assets/images/back.jpeg',
            ),
          ),
        ),
      ),
    ),
  );
}



*/
