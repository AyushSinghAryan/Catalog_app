import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

// first to use
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // constructor
  @override
  Widget build(BuildContext context) {
    //  num x = 3;
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme().lightTheme(context),
      darkTheme: MyTheme().DarkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        // "/login": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
    // funv({int rupee = 100}){

    // }
  }
}
