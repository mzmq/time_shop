import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_shop/providers/cart_provider.dart';
import 'package:time_shop/providers/order_provider.dart';

import './screens/home_page_screen.dart';
import './providers/products_provider.dart';
import './models/products.dart';
void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(ctx)=> ProductProvider()) ,
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => OrderProvider())


      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageScreen(),
      routes: {

      },
    );
  }
}
