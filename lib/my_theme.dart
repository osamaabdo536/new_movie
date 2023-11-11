import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Color(0xff1A1A1A);
  static Color yellowColor = Color(0xffFFBB3B);
  static Color blackColor = Color(0xff121312);
  static Color whiteColor = Colors.white;
  static Color gryColor = Color(0xff514F4F);
  static const darkGry = Color(0xff282A28);
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLightColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
    ),
  );
}
