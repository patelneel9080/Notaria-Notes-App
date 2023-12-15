import 'package:flutter/material.dart';

bool isLight = true;

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme:
        AppBarTheme(centerTitle: false, backgroundColor: Colors.greenAccent),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.deepPurpleAccent,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}

class MyThemeData {
  ThemeData whitebackground = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue))));
}
