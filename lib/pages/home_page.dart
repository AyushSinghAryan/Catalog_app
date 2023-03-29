import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

// import 'package:flutter_application_1';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var name = "Ayush";
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Assistant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: ((context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            })),
      ),
      drawer: MyDrawer(),
    );
  }
}
