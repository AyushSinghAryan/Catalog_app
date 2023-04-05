import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../theme.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Shopping Assistant".text.xl3.bold.color(MyTheme.darkBluishColor).make(),
      "Trending products".text.xl.make()
      // BOth are same OR
      // Text('Shopping Assistant')
    ]);
  }
}
