// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';

import '../../models/catalog.dart';
// import '../../widgets/theme.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true, //imp
        itemCount: CatalogModel.items!.length,
        itemBuilder: ((context, index) {
          final catalog = CatalogModel.items![index];
          // final catalog = CatalogModel.getByPosition(index);

          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(
                            catalog: catalog,
                            // suppose i want to open catalog with id 2
                            // which ever catalog i click we get id 2 item
                            // catalog: CatalogModel.getById(2),
                          ))),
              child: CatalogItem(catalog: catalog));
        }));
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image.toString())),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name!.text.lg.color(context.accentColor).bold.make(),
            catalog.desc!.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              // here we csn put multiplr buttons
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                // we extract the elvated button Add to cart
                // beacuse we make from state less to stateful
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).color(context.cardColor).square(150).roundedLg.make().py12();
  }
}

// class AddToCart extends StatefulWidget {
//   final Item catalog;
//   const AddToCart({
//     Key? key,
//     required this.catalog,
//   }) : super(key: key);

//   @override
//   State<AddToCart> createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
//   // bool isInCart = false;
//   final _cart = CartModel();

//   @override
//   Widget build(BuildContext context) {
//     bool isInCart = _cart.items.contains(widget.catalog) ?? false;

//     return ElevatedButton(
//         onPressed: (() {
//           // isInCart = isInCart.toggle();
//           // agar item already in cart than we dont again that item again
//           if (!isInCart) {
//             // final _catalog = CatalogModel();
//             isInCart = isInCart.toggle();

//             // how to add in cart
//             final _catalog = CatalogModel();
//             // final _cart = CartModel();
//             _cart.catalog = _catalog;
//             _cart.add(widget.catalog);

//             setState(() {});
//           }
//         }),
//         style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all(context.theme.buttonColor),
//             shape: MaterialStateProperty.all(StadiumBorder())),
//         child: isInCart ? Icon(Icons.done) : "Buy".text.make());
//   }
// }
