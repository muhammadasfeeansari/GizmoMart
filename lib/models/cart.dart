// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: unnecessary_getters_setters

import 'package:velocity_x/velocity_x.dart';

import 'package:practice/core/store.dart';
import 'package:practice/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  // collection of ids
  final List<int> itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get Items In the Cart - store ids
  List<Item> get items => itemIds.map((id) => _catalog.getById(id)).toList();

  // Get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
      
       // Add Items
  void add(Item item) {
    itemIds.add(item.id);
  }

  // Remove Items
  void remove(Item item) {
    itemIds.remove(item.id);
  }

  
}


//add 
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);  

  @override
  perform() {
    store!.cart.add(item); 
  }
}

//remove

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);  

  @override
  perform() {
    store!.cart.remove(item); 
  }
}

