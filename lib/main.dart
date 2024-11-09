import 'package:flutter/material.dart';
import 'package:market/pages/product_detail_page.dart';
import 'package:market/pages/products_page.dart';
import 'package:market/providers/cart.dart';
import 'package:market/providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {return Products();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {return Cart();
          },
        ),  
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Магазин',
        theme: ThemeData(
            useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.lime
            )
            .copyWith(
            secondary: Colors.deepOrange
            ),
        ),
        home:  const ProductsPage(
        ),
        routes: {
      
          ProductDetailPage.route: (context) => const ProductDetailPage(),
          // FilterPage.route: (context) => const FilterPage(),
          // MealPage.route: (context) => const MealPage(),
          
        },
      ),
    );
  }
}

