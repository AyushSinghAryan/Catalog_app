import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  // bool isInCart = false;
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;

    return ElevatedButton(
        onPressed: (() {
          // isInCart = isInCart.toggle();
          // agar item already in cart than we dont again that item again
          if (!isInCart) {
            // final _catalog = CatalogModel();
            isInCart = isInCart.toggle();

            // how to add in cart
            final _catalog = CatalogModel();
            // final _cart = CartModel();
            _cart.catalog = _catalog;
            _cart.add(widget.catalog);

            setState(() {});
          }
        }),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        // child: isInCart ? Icon(Icons.done) : "Buy".text.make());
        //  in some phine Buy take so much space
        child: isInCart
            ? const Icon(Icons.done)
            : Icon(CupertinoIcons.cart_badge_plus));
  }
}
