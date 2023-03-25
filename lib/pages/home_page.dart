import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

// import 'package:flutter_application_1';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var name = "Ayush";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text('hello $name'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
