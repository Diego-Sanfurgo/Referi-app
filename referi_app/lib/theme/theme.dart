import 'package:flutter/material.dart';

import '../../theme/colors.dart' as colors;

ThemeData get theme => _referiTheme;

ThemeData _referiTheme = ThemeData(
  primarySwatch: colors.primary,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  //
  inputDecorationTheme: _inputDecorationTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevatedButtonStyle),
  appBarTheme: _appBarTheme,
  bottomNavigationBarTheme: _barTheme,
  listTileTheme: _tileThemeData,
);

ListTileThemeData _tileThemeData =
    const ListTileThemeData(iconColor: Colors.black87);

BottomNavigationBarThemeData _barTheme = BottomNavigationBarThemeData(
  // elevation: 6,
  // backgroundColor: colors.primary.shade400,
  backgroundColor: Colors.white,
  // selectedItemColor: colors.secondaryDark,
  selectedItemColor: colors.primary.shade700,
  unselectedItemColor: Colors.grey,
  type: BottomNavigationBarType.fixed,
  unselectedLabelStyle: const TextStyle(fontSize: 12),
  selectedLabelStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
);

InputDecorationTheme _inputDecorationTheme = const InputDecorationTheme(
  border: OutlineInputBorder(),
  labelStyle: TextStyle(fontSize: 14),
);

ButtonStyle _elevatedButtonStyle = ButtonStyle(
    maximumSize: MaterialStateProperty.all(const Size(double.infinity, 36)),
    minimumSize: MaterialStateProperty.all(const Size(double.infinity, 36)),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return const Color(0XFFD9D9D9);
      }
      return colors.secondary;
    }),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 6, horizontal: 12)));

AppBarTheme _appBarTheme = const AppBarTheme(
    titleTextStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87));
