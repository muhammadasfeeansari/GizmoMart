// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/cart.dart';
import 'package:practice/models/catalog.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

 
  // ignore: non_constant_identifier_names
  final _Cart = CartModel();
 
  @override
  Widget build(BuildContext context) {
    bool isInCart = _Cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(mytheme.blueishcolor),
        ),
        onPressed: () {
          
          if(!isInCart){
            isInCart = isInCart.toggle();
          final _Catalog = CatalogModel();
          
          _Cart.catalog = _Catalog;
          _Cart.add(catalog);
          // setState(() {});
          }
        },
        child: isInCart
            ? Icon(Icons.done)
            : Icon(CupertinoIcons.cart_badge_plus),
            
            );
  }
}