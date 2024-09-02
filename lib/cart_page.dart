import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.make(),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(mytheme.blueishcolor),
            ),
            onPressed: () {},
            child: "Buy".text.xl.color(Colors.white).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class __CartLiState extends StatefulWidget {
  const __CartLiState({super.key});

  @override
  State<__CartLiState> createState() => ___CartLiStateState();
}

class ___CartLiStateState extends State<__CartLiState> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}
