import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/cart.dart';
import 'package:practice/models/catalog.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _Cart = CartModel();
 
  @override
  Widget build(BuildContext context) {
    bool isInCart = _Cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(mytheme.blueishcolor),
        ),
        onPressed: () {
          
          if(!isInCart){
            isInCart = isInCart.toggle();
          final _Catalog = CatalogModel();
          
          _Cart.catalog = _Catalog;
          _Cart.add(widget.catalog);
          setState(() {});
          }
        },
        child: isInCart
            ? Icon(Icons.done)
            : Icon(CupertinoIcons.cart_badge_plus),
            
            );
  }
}