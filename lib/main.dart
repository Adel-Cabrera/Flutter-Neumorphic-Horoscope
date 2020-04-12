import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphicbuttoni/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LightSource myLight = LightSource.topLeft;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NeumorphicTheme(
        usedTheme: UsedTheme.DARK,
        theme: NeumorphicThemeData(
          baseColor: Color(0xFFFFFFFF),
          accentColor: Colors.deepPurpleAccent,
          defaultTextColor: Colors.black,
          intensity: 0.5,
          lightSource: myLight,
          depth: 10,
        ),
        darkTheme: NeumorphicThemeData(
          baseColor: Color(0xFF3E3E3E),
          accentColor: Colors.pink,
          defaultTextColor: Colors.white,
          intensity: 0.4,
          lightSource: myLight,
          depth: 6,
        ),
        child: HomePage(),
      ),
    );
  }
}
