import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  // making singlton class
  //to create object only one time
  static final cartModel = CartModel._internal();
  // creating costrucor of this
  CartModel._internal();
  // factory construcor
  factory CartModel() => cartModel;

  late CatalogModel _catalog;
  // map item on basis of id
  // in jason id we have in form of int
  // initally blank
  // store ids of each item
  final List<int> _itemIds = [];
// basically below catalog filed can not directly access
// it access through catalog
// encapsulation
  // CatalogModel? get catalog => _catalog;
  // set catalog
  // set catalog(CatalogModel newCatalog) {
  //   _catalog = newCatalog;
  // }

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // map items with ids
  // get items in the cart
  // item milney key baad to list kar dey gey
  // _itemIds mey data ley gey
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  // learn more about fold
  // num get totalPrice =>
  //     items.fold(0, (total, current) => total + current.price);
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!.toInt());

  // add item in ncart
  void add(Item item) {
    _itemIds.add(item.id!.toInt());
  }

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
