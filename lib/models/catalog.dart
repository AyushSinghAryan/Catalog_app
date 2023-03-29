class CatalogModel {
  static final items = [
    // using static we can directly access the items
    Item(
        id: 1,
        name: "iPhone 14 Pro Max",
        desc: "Apple iPhone 14th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://ismart.co.in/wp-content/uploads/2022/09/iphone-14-pro-finish-select-202209-6-1inch-deeppurple.png")
  ];
}

class Item {
  final int? id;
  final String? name;
  final String? desc; //description
  final num? price;
  final String? color;
  final String? image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}
