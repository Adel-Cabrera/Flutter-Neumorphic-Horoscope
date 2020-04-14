import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'src/widgets/simple_hidden_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LightSource myLight = LightSource.topLeft;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: NeumorphicTheme(
        usedTheme: UsedTheme.LIGHT,
        theme: NeumorphicThemeData(
          // baseColor: Color(0xFFFFFFFF),
          baseColor: Color(0xFFcc34a1),
          accentColor: Color(0xFF9c0c74),
          variantColor: Color(0xFF7a1e60),

          defaultTextColor: Colors.white,
          intensity: 0.45,
          lightSource: myLight,
          depth: 10,
        ),
        darkTheme: NeumorphicThemeData(
          //baseColor: Color(0xFF3E3E3E),
          baseColor: Color(0xFF25292D),
          accentColor: Color(0xFF16ABCC),
          defaultTextColor: Colors.white,
          variantColor: Color(0xFF16ABCC),
          intensity: 0.25,
          lightSource: myLight,
          depth: 3.5,
        ),
        child: //MyHiddenDrawer(),
            SimpleHidden(),
      ),
    );
  }
}
