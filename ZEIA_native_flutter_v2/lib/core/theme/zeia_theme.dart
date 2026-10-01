import 'package:flutter/material.dart';

class ZeiaTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff080808),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff8b5cf6), brightness: Brightness.dark),
    useMaterial3: true,
    fontFamily: 'sans',
    cardTheme: const CardThemeData(color: Color(0xff141414), margin: EdgeInsets.zero),
  );
}
