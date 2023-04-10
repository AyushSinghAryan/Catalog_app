// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/theme.dart';

import '../widgets/drawer.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/item_widget.dart';
import '../widgets/home_widgets/catalog_header.dart';
// import 'home_widgets/catalog_list.dart';

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
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            MyRoutes.cartRoute,
          );
        },
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  const CatalogList()
                      .py16()
                      .expand() // means we wrap this widget with expanded widget
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            )),
      ),
    );
  }
}






// image ka stl class

// var name = "Ayush";
// now we dont need dummy list
// final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
// return Scaffold(
// appBar: AppBar(
//   title: Text("Shopping Assistant"),
// ),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
// now Grid View
// ? GridView.builder(
//GridDEligate ek row may kitney items honey yeh define Karey ga
// mainAxisSpacing use for spacing
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 16),
//           itemBuilder: ((context, index) {
//             final item = CatalogModel.items![index];
//             return Card(
//                 clipBehavior: Clip.antiAlias,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 child: GridTile(
//                   child: Image.network(item.image.toString()),
//                   header: Container(
//                     child: Text(
//                       item.name.toString(),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(color: Colors.deepPurple),
//                   ),
//                   footer: Container(
//                     child: Text(
//                       item.price.toString(),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(color: Colors.deepPurple),
//                   ),
//                 ));
//           }),
//           itemCount: CatalogModel.items!.length,
//         )
//       // if we use same itemBuilder then problem is wo listtile ki form mey tha

//       // ? ListView.builder(
//       //     // itemCount: dummyList.length,
//       //     // kyuki inital data null hai so it will give error si no len intial
//       //     itemCount: CatalogModel.items!.length,
//       //     itemBuilder: ((context, index) {
//       //       return ItemWidget(
//       //         // item: dummyList[index],
//       //         item: CatalogModel.items![index],
//       //       );
//       //     }))
//       : Center(
//           child: CircularProgressIndicator(),
//         ),
// ),
// drawer: MyDrawer(),
