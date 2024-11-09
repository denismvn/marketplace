import 'package:flutter/material.dart';
import 'package:market/providers/products.dart';
import 'package:market/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid ({super.key, required this.showFavourite});
  final bool showFavourite;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = 
     showFavourite ? productsData.items : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10), 
        itemBuilder: (context, index) => 
        ChangeNotifierProvider(
          create: (context) => 
            products[index],
          child: const ProductItem()),
      itemCount: products.length,
    );
  }
}