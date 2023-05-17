import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      indicatorColor: Colors.black,
      canvasColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
      ),
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
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        labelSmall: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ));
}

ThemeData buildDarkTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      indicatorColor: Colors.white,
      canvasColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
      ),
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
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        labelSmall: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ));
}
