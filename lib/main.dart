import 'package:flutter/material.dart';

// first to use
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
      child: Container(
        child: Center(child: Text('hello')),
      ),
    ));
  }
}
