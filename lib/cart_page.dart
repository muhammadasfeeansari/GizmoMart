// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:practice/core/store.dart';
import 'package:practice/models/cart.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart"
            .text
            .bodyLarge(context)
            .color(Theme.of(context).textTheme.displayLarge?.color ??
                mytheme.blueishcolor)
            .xl3
            .make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          __CartLiState().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    // final CartModel _Cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: const {},
            mutations: const {RemoveMutation},
            builder: (context, _, __) {
              final CartModel _Cart = (VxState.store as MyStore).cart;
              return "\$${_Cart.totalPrice}".text.xl5.make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(mytheme.blueishcolor),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying Not Supported Yet".text.xl.bold.make(),
                  backgroundColor: Colors.redAccent[700],
                ),
              );
            },
            child: "Buy".text.xl.color(Colors.white).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class __CartLiState extends StatelessWidget {
  final CartModel _Cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: const {RemoveMutation},
      builder: (context, _, __) {
        return _Cart.items.isEmpty
            ? "Nothing To Show".text.xl3.make().centered()
            : ListView.builder(
                itemCount: _Cart.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () => RemoveMutation(_Cart.items[index]),
                  ),
                  title: _Cart.items[index].name.text.make(),
                ),
              );
      },
    );
  }
}
