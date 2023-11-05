import 'package:flutter/material.dart';

const _customColor = Color(0xFF5B0FB7);
const _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  AppTheme({this.selectedColor = 0})
      : assert(
          selectedColor >= 0 && selectedColor < _colorThemes.length,
          "Colors must be between 0 and ${_colorThemes.length - 1}",
        );

  final int selectedColor;

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
