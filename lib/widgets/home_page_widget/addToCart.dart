// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/core/store.dart';
import 'package:practice/models/cart.dart';
import 'package:practice/models/catalog.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: const {AddMutation,RemoveMutation},
      builder: (context, _, __) {
        final CartModel _cart = (VxState.store as MyStore).cart;
        bool isInCart = _cart.items.contains(catalog);
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(mytheme.blueishcolor),
          ),
          onPressed: () {
           
            if (!isInCart) {
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Product Added In The Cart".text.color(Colors.white).xl.bold.make(),
                  backgroundColor: Colors.redAccent[700],
                ));
              AddMutation(catalog);
            }
          },
          child: isInCart
              ? Icon(Icons.done)
              : Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
        );
      },
    );
  }
}
