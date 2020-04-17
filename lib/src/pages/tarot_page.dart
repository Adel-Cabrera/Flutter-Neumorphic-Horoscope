import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TarotPage extends StatefulWidget {
  @override
  _TarotPageState createState() => _TarotPageState();
}

class _TarotPageState extends State<TarotPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Container(
          height: 100.0,
          child: PageView.builder(
            itemCount: 22,
            controller: PageController(viewportFraction: 0.2),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Card ${i + 1}",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
