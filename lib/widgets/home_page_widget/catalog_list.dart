import 'package:flutter/material.dart';
import 'package:practice/home_detail.dart';
import 'package:practice/widgets/home_page_widget/catalog_image.dart';
import 'package:practice/models/catalog.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  // ignore: use_super_parameters
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text
                .textStyle(context.captionStyle)
                .bold
                .lg
                .color(Theme.of(context).textTheme.displayLarge?.color ?? mytheme.blueishcolor)
                .make(),
            catalog.desc.text.color(Theme.of(context).textTheme.displayLarge?.color ?? mytheme.blueishcolor).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(mytheme.blueishcolor),
                    ),
                    onPressed: () {},
                    child: "Add to cart".text.color(Colors.white).bold.make()),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}
