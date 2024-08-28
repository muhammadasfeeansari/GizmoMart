import 'package:flutter/material.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "GizmoMart".text.xl5.bold.color(Theme.of(context).textTheme.displayLarge?.color ?? mytheme.blueishcolor).make(),
        "Trending Products".text.color(Theme.of(context).textTheme.displayLarge?.color ?? mytheme.blueishcolor).xl2.make()
      ],
    );
  }
}