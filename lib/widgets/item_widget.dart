import 'package:flutter/material.dart';
import 'package:practice/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
      
        leading: Image.network(item.image),
        title: Text(item.name,style: TextStyle(fontWeight: FontWeight.w600),),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}", style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 17),),
      ),
    );
  }
}
