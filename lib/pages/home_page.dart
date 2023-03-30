import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

// import 'package:flutter_application_1';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData(); // custom method
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    // map this decode with map
    var productsData = decodeData["products"];
    // we got data in form of list  but we have to map it
    // we have mltiple data like phone , laptop
    // list humko miley gi product data sey
    // .from ka matalab kaha sey list mil rahi hai
    // now we got list abb hum chatey our list convert into listOfItems
    // humko map ka type batana hoga
    // we have data in form of list inside map
    ///List<Item> list = List.from(productsData)
    // catalog item bhi  ek list of items hai
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    // agar hummey app restart key rahe gey tho only one data visible
    // so hum setstate karey gey we  call build mathod again
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // var name = "Ayush";
    // now we dont need dummy list
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Assistant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? ListView.builder(
                // itemCount: dummyList.length,
                // kyuki inital data null hai so it will give error si no len intial
                itemCount: CatalogModel.items!.length,
                itemBuilder: ((context, index) {
                  return ItemWidget(
                    // item: dummyList[index],
                    item: CatalogModel.items![index],
                  );
                }))
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
