import 'package:flutter/material.dart';
import 'package:market/providers/products.dart';
import 'package:provider/provider.dart';


class ProductDetailPage extends StatefulWidget {

  static String route = "/productDetails";

  const ProductDetailPage({
    super.key,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;

    final loadedProducts = Provider.of<Products>(context, listen: false).findById(productID);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(loadedProducts.name),
      ),
    );
  }
}
