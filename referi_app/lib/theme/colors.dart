import 'package:flutter/material.dart';

const int _orangePrimaryValue = 0xFFFF9800;
MaterialColor primary = const MaterialColor(_orangePrimaryValue, <int, Color>{
  50: Color(0xFFFFF3E0),
  100: Color(0xFFFFE0B2),
  200: Color(0xFFFFCD80),
  300: Color(0xFFFFB84D),
  400: Color(0xFFFFA826),
  500: Color(_orangePrimaryValue),
  600: Color(0xFFfB8D00),
  700: Color(0xFFF57D00),
  800: Color(0xFFEF6D00),
  900: Color(0xFFE65200),
});

// const int _blueSecondaryValue = 0XFF0C9EE8;
// MaterialAccentColor secondaryAccent = const MaterialAccentColor(
//     _blueSecondaryValue, <int, Color>{50: Color(0XFF123456)});

Color secondary = const Color(0XFF0C9EE8);
Color secondaryLight = const Color(0XFFE1F6FE);
Color secondaryDark = const Color(0XFF0070B5);

const Color colorOverlay = Color(0x99000000);
