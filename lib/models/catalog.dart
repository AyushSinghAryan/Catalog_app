// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  // catalog.item is also a list of items
  static List<Item>? items; // real life mey data null rahe ga starting mey
  // =
  // [
  //   // using static we can directly access the items
  //   Item(
  //       id: 1,
  //       name: "iPhone 14 Pro Max",
  //       desc: "Apple iPhone 14th generation",
  //       price: 999,
  //       color: "#33505a",
  //       image:
  //           "https://ismart.co.in/wp-content/uploads/2022/09/iphone-14-pro-finish-select-202209-6-1inch-deeppurple.png")
  // ];
}

class Item {
  final int? id;
  final String? name;
  final String? desc; //description
  final num? price;
  final String? color;
  final String? image;

  Item({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      color: map['color'] != null ? map['color'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
// to help json finding key and values we define a
// custom constrom with custom name "fromMap" it is decode method
// key is not string than write dynamic
// map custom name
// factory help in chosing a construtor
// map to class
// factory Item.fromMap(Map<String, dynamic> map) {
//   return Item(
//     id: map["id"],
//     name: map["name"],
//     desc: map["desc"],
//     price: map["price"],
//     color: map["color"],
//     image: map["image"],
//   );
// }

// comment region other way to genrate it using vs code
// type data class genrator it will  auto matic genrate it

// encode class to map
// or we can sey key value ban jaye gi aur value key
//
// it matches with backend part
//   toMap() => {
//         "id": id,
//         "name": name,
//         "desc": desc,
//         "price": price,
//         "color": color,
//         "image": image,
//       };
// }
// if key and value are same than it easy to commuincate
