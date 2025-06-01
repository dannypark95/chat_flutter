import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  ),
  scaffoldBackgroundColor: Colors.grey.shade300,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade500,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade500,
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
    titleMedium: TextStyle(color: Colors.black87),
  ),
);