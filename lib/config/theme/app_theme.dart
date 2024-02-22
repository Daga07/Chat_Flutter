import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 232, 226, 233);

const List<Color> _colotThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class Apptheme {
  final int selectedColor;

  Apptheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colotThemes.length - 1,
            'colors >=0 ${_colotThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colotThemes[selectedColor],
      //brightness: Brightness.dark
    );
  }
}
