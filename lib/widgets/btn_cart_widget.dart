import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../screens/cart_screen.dart';
class BtnCartWidget extends StatelessWidget {
  const BtnCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<CartProvider>(
      builder: (context, value, child) =>  Badge(
          elevation: 10,
          badgeContent: Text(value.CartCount.toString() ,style: TextStyle(color: Colors.white),),
          position: BadgePosition(   start: 27 ,bottom: 30) ,
          child: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> CartScreen())) ;
          }, icon: Icon(Icons.shopping_cart))),

    );
  }
}
