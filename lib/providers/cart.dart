import 'package:flutter/material.dart';
import 'package:market/providers/product.dart';

class _CartItem {
  final String id;
  final Product product;
  final int quantity;
  late final double price;
  
  _CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  }){
    price = product.price * quantity;
  }
}

class Cart with ChangeNotifier{
  final Map<String, _CartItem> _order = {};

  Map <String, _CartItem> get order => _order;

  void addProductToCart (Product product) {
    if (_order.containsKey(product.id)) {
      _order.update(product.id, (cartitem) => 
        _CartItem(
          id: cartitem.id, 
          product: product, 
          quantity: cartitem.quantity + 1,
        )
      );
    } else {
      _order.putIfAbsent(product.id, () => 
        _CartItem(
          id: DateTime.now().toString(), 
          product: product, 
          quantity: 1,
        )
      );
    }
  }
}