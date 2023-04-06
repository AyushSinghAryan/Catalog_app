import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          // here we csn put multiplr buttons
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: (() {}),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        // top: false,
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image.toString(),
              ),
            ).h32(context),
            Expanded(
                child: VxArc(
                    arcType: VxArcType.CONVEY,
                    height: 30,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name!.text.xl4
                              .color(context.accentColor)
                              .bold
                              .make(),
                          catalog.desc!.text.xl
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                          "Warum friedlich schon die freunde und du mich ruft, weiter bist so verschwiegen du, die in hast liebe ich es wärest geliebet einz'ges, weißt der winde die stillestehn einz'ges mit. Ankleiden weh und in zu stürmten dahinten sanken sanft. Geliebet weh jedoch mund weiter, brust da der immer ist. Liebe."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16()
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
