import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      indicatorColor: Colors.black,
      canvasColor: Colors.black,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ));
}

ThemeData buildDarkTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      indicatorColor: Colors.white,
      canvasColor: Colors.white,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ));
}
