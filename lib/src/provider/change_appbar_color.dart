import 'package:flutter/material.dart';

class ChangeAppBarColor extends ChangeNotifier {
  Color _color = Colors.deepPurpleAccent;

  get baseColor {
    return _color;
  }

  set setBaseColor(Color color) {
    this._color = color;

    notifyListeners();
  }
}
