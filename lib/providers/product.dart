import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String name;
  final String description;
  final String imageURL;
  final double price;
  bool isFavourite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.price,
    this.isFavourite = false,
  });

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
