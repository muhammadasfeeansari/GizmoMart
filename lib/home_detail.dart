// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:practice/utills/routes.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color:context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(mytheme.blueishcolor),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.CartPageRoute);
                    },
                    child: "Add to cart".text.lg.color(Colors.white).bold.make())
                .wh(130, 50),
          ],
        ).py(18).pOnly(right: 20, left: 20),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h40(context),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.top,
              arcType: VxArcType.convey,
              child: Container(
                color: context.theme.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text
                        .textStyle(context.captionStyle)
                        .bold
                        .xl3
                        .color(Theme.of(context).textTheme.displayLarge?.color ?? mytheme.blueishcolor).make(),
                        
                    catalog.desc.text.lg.color(Theme.of(context).textTheme.displayLarge?.color ?? mytheme.blueishcolor).make(),
                    5.heightBox,
                    "Discover the latest in technology with top-tier gadgets like the iPhone, PS5, and wireless earbuds. Experience cutting-edge performance, sleek designs, and unparalleled functionality. Whether you're gaming, staying connected, or enjoying your favorite music."
                        .text.textStyle(context.captionStyle).size(13)
                        .make().pOnly(left: 16,right: 16).py12()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
