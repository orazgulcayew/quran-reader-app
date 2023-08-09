import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff8352fd);
  static const Color primaryColor2 = Color(0xff3913b8);

  static const Color secondaryColor = Color(0xff00cffd);
  static const Color secondaryColor2 = Color(0xff2fb5fc);

  static const black = Color(0xff121212);
  static const white = Colors.white;

  static const background = Color(0xfff2f6ff);

  static const Color neutralDarkColor = Color(0xFF1a2151);
  static const Color neutralLightColor = Color(0xFFe3e8ff);

  static ThemeData darkTheme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: primaryColor);
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: background,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor2,
        showUnselectedLabels: true,
        backgroundColor: background,
        unselectedItemColor: neutralDarkColor.withOpacity(0.7),
      ),
    );
  }
}
