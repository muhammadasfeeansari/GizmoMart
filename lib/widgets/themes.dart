// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class mytheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        cardColor: Colors.white,
        canvasColor: creamcolor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: blueishcolor, // This will set the button color
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );

  // Dark Theme

  static ThemeData darktheme(BuildContext context) => ThemeData(
        cardColor: Colors.black,
        canvasColor: darkcreamcolor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                lightblueishcolor, // This will set the button color
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Colors.white), // For large text
          titleLarge: TextStyle(color: Colors.white), // For smaller text
        ),
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 134, 72, 72),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        brightness: Brightness.dark,
      );

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcreamcolor = Vx.gray900;
  static Color blueishcolor = Color(0xff403b58);
  static Color lightblueishcolor = Vx.indigo500;
}
