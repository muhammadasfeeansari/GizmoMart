import 'package:flutter/material.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mytheme.creamcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bodyLarge(context).color(mytheme.blueishcolor).xl4.make(),
      ),
    );
  }
}
