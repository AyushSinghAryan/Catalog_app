import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  // Item class we created in catalog app
  // const ItemWidget({super.key, required this.item});
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Image.network(item.image.toString()),
        ),
        title: Text(item.name.toString()),
        subtitle: Text(item.desc.toString()),
        trailing: Text(
          "\$${item.price.toString()}",
          style: TextStyle(
              color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
