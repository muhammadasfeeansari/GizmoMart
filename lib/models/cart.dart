
import 'package:practice/models/catalog.dart';

class CartModel {
static final CartModel _instance = CartModel._internal();

  CartModel._internal();

  factory CartModel() => _instance;


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
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // Add Items
  void add(Item item) {
    itemIds.add(item.id);
  }

  // Remove Items
  void remove(Item item) {
    itemIds.remove(item.id);
  }
}
