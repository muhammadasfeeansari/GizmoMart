// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, duplicate_ignore
// ignore_for_file: sort_child_properties_last, unnecessary_null_comparison, non_constant_identifier_names, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/core/store.dart';
import 'package:practice/models/cart.dart';
import 'package:practice/utills/routes.dart';
import 'package:practice/widgets/home_page_widget/catalog_header.dart';
import 'package:practice/widgets/home_page_widget/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:practice/models/catalog.dart';
import 'package:practice/widgets/drawer.dart';
import 'package:practice/widgets/item_widget.dart';
import 'package:practice/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // http work'!

  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  
  

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
     
    //  final response = await http.get(Uri.parse(url));
    //  final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation,RemoveMutation},
          builder:(context,_,__)=> FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.CartPageRoute),
            backgroundColor: mytheme.blueishcolor,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ).badge(count: _cart.items.length,color: Colors.white,textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py8().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
