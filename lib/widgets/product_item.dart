import 'package:flutter/material.dart';
import 'package:market/providers/cart.dart';
import 'package:market/providers/product.dart';
import 'package:market/pages/product_detail_page.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  
  const ProductItem({super.key,});

  

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart =Provider.of<Cart>(context, listen: false);
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            product.name,
            textAlign: TextAlign.center,
            ),
          leading: IconButton(
            iconSize: 20,
            onPressed: (){
              product.toggleFavouriteStatus();
            },
            icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
          ),
          trailing: IconButton(
            iconSize: 20,
            onPressed: (){
              cart.addProductToCart(product);
            },
            icon: const Icon(Icons.shopping_bag_outlined),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailPage.route, arguments: product.id);
          },
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}