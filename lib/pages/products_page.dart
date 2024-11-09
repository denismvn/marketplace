import 'package:flutter/material.dart';
// import 'package:market/providers/products.dart';
import 'package:market/widgets/products_grid.dart';
// import 'package:provider/provider.dart';

enum Prod  {
  favourite,
  all,
}

class ProductsPage extends StatefulWidget {

  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected:(value) => {
              setState(() {
                if (value == Prod.all) {
                  _showOnlyFavourites = false;
                } else if (value == Prod.favourite) {
                  _showOnlyFavourites = true;
                }
              }),

              // if (value == 1) {
              //   Provider.of<Products>(context, listen: false).showAllProducts()
              // } else if (value == 0) {
              //   Provider.of<Products>(context, listen: false).showFavouriteProducts()
              // }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: Prod.favourite,
                child: Text('Только избранные'), 
              ),
              const PopupMenuItem(
                value: Prod.all,
                child: Text('Все'),
              )
            ]
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Макасин'),
      ),
      body: ProductsGrid(showFavourite: _showOnlyFavourites,),
      drawer: const Drawer(
      ),
    );
  }
}

