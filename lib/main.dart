import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

// first to use
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // constructor

  @override
  Widget build(BuildContext context) {
    //  num x = 3;
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/home',
      routes: {
        "/": (context) => const LoginPage(),
        // "/login": (context) => LoginPage(),
        "/home": (context) => LoginPage(),
      },
    );
    // funv({int rupee = 100}){

    // }
  }
}
