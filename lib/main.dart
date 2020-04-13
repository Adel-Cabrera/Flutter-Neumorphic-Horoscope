import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'src/provider/change_appbar_color.dart';
import 'src/widgets/hidden_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LightSource myLight = LightSource.topLeft;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeAppBarColor(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: NeumorphicTheme(
          usedTheme: UsedTheme.LIGHT,
          theme: NeumorphicThemeData(
            // baseColor: Color(0xFFFFFFFF),
            baseColor: Colors.deepPurpleAccent,
            accentColor: Colors.white,
            defaultTextColor: Colors.white,
            variantColor: Colors.deepPurpleAccent,
            intensity: 0.5,
            lightSource: myLight,
            depth: 10,
          ),
          darkTheme: NeumorphicThemeData(
            //baseColor: Color(0xFF3E3E3E),
            baseColor: Color(0xFF25292D),
            accentColor: Color(0xFF16ABCC),
            defaultTextColor: Colors.white,
            variantColor: Color(0xFF16ABCC),
            intensity: 0.4,
            lightSource: myLight,
            depth: 6,
          ),
          child: MyHiddenDrawer(),
        ),
      ),
    );
  }
}
