import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold,
              fontSize: 18)),
      primaryTextTheme: GoogleFonts.latoTextTheme());

// we can make multiple themea
  ThemeData DarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );

// colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xfff403b58);
}
