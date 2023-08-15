import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff8352fd);
  static const Color primaryColor2 = Color(0xff3913b8);

  static const Color secondaryColor = Color(0xff00cffd);
  static const Color secondaryColor2 = Color(0xff2fb5fc);

  static const black = Color(0xff121212);
  static const white = Colors.white;

  static const scaffoldBackgroundColor = Color(0xfff2f6ff);
  static const darkScaffoldBackgroundColor = Color(0xff070313);

  static const background = white;
  static const darkBackground = Color(0xff171228);

  static const Color neutralDarkColor = Color(0xFF1a2151);
  static const Color neutralLightColor = Color(0xFFe3e8ff);

  static const Color selectedItemColor = primaryColor2;
  static const Color selectedItemColorDark = primaryColor;

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: darkScaffoldBackgroundColor,
      splashColor: neutralDarkColor.withOpacity(0.5),
      brightness: Brightness.dark,
      dividerTheme: const DividerThemeData(color: Colors.white10),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: darkBackground,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: neutralLightColor,
      ),
      colorScheme: const ColorScheme.dark(
          background: darkBackground,
          secondaryContainer: neutralDarkColor,
          onPrimaryContainer: neutralLightColor,
          primaryContainer: primaryColor),
      highlightColor: neutralDarkColor.withOpacity(0.5),
      switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return null;
      })),
      appBarTheme: const AppBarTheme(
          backgroundColor: darkBackground,
          centerTitle: true,
          titleTextStyle: TextStyle(color: white, fontSize: 20)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: selectedItemColorDark,
        showUnselectedLabels: true,
        backgroundColor: darkBackground,
        unselectedItemColor: Colors.white70,
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      splashColor: neutralLightColor.withOpacity(0.5),
      highlightColor: neutralLightColor.withOpacity(0.5),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: primaryColor.withOpacity(0.1),
        hintStyle: const TextStyle(color: Colors.black87),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
      dividerTheme: const DividerThemeData(color: Colors.black12),
      colorScheme: ColorScheme.light(
          background: white,
          secondaryContainer: neutralLightColor,
          onPrimaryContainer: primaryColor2,
          primaryContainer: primaryColor2.withOpacity(0.1)),
      listTileTheme: const ListTileThemeData(
        iconColor: primaryColor2,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(color: white, fontSize: 20)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: selectedItemColor,
        showUnselectedLabels: true,
        backgroundColor: background,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}
