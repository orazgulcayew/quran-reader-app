import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff5307B5);
  static const Color secondaryColor = Color(0xffFFA500);
  static const Color tertiaryColor = Color(0xFF008080);
  static const Color neutralColor = Color(0xFF333333);
  static const Color complementaryColor = Color(0xFFFF3399);

  static const black = Color(0xff121212);
  static const darkGrey = Color(0xff333333);
  static const lightGrey = Color(0xffCCCCCC);

  static ThemeData darkTheme() {
    return ThemeData(useMaterial3: true);
  }

  static ThemeData lightTheme() {
    return ThemeData(
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          unselectedItemColor: darkGrey,
        ));
  }
}
