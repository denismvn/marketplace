import 'package:flutter/material.dart';
import 'package:market/providers/product.dart';

class Products with ChangeNotifier{
  // bool _showFavouriteProducts = false;
  final List<Product> _items = [

  Product(
    id: 'p1', 
    name: 'Красная рубашка', 
    description: "Реально красная рубашка", 
    imageURL: "https://optsad.ru/uploads/monthly_2018_12/6.jpg.6f528cc65215f041267a1b83cc5bf752.jpg", 
    price: 1499,
  ),

  Product(
    id: "p2", 
    name: 'Брюки', 
    description: 'Целка, муха не е**лсь', 
    imageURL: 'https://images-eu.ssl-images-amazon.com/images/I/41NfqBrWBjL._UL1000_.jpg', 
    price: 1299,
  ),

  Product(
    id:'p3', 
    name: 'Желтый шарф', 
    description: 'Самый желтый', 
    imageURL: 'https://cs2.livemaster.ru/storage/2f/df/bf9e0a3ae47eb9b8144a257186v4--aksessuary-kashemirovyj-sharf.jpg', 
    price: 299,
  ),

  Product(
    id: 'p4', 
    name: 'Сковорода', 
    description: 'Обеспечивает наилучшую защиту от пуль', 
    imageURL: 'https://files.cults3d.com/uploaders/14027944/illustration-file/7d5c92d6-4f95-409d-83fe-e870c3640b95/06.jpg',
    price: 9999999999,
  ),
];

List<Product> get items => _items;
// .where((product) => 
// (!_showOnlyFavourites || product.isFavourite))
// .toList();

List<Product> get favItems => _items
.where((product) => product.isFavourite)
.toList();

Product findById(String id) {
  return _items.firstWhere((product) => product.id == id);
}

// void showFavouriteProducts (){
//   _showFavouriteProducts = true;
//   notifyListeners();
// }

// void showAllProducts (){
//   _showFavouriteProducts = false;
//   notifyListeners();
// }

void addProduct() {
  notifyListeners();
}
}