import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_shop/providers/cart_provider.dart';

import '../providers/products_provider.dart';
import '../widgets/btn_cart_widget.dart';
class ProductDetailsScreen extends StatelessWidget {
  String productId ;

   ProductDetailsScreen({Key? key , required this.productId ,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getData =Provider.of<ProductProvider>(context).item;
    final getIdList = getData.firstWhere((element) => element.id == productId);
    final getCartData = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(getIdList.title),
        actions: [
          BtnCartWidget(),
          SizedBox(width: 15,)
        ],

      ),
       body: Column(
         children: [
           Image.network(getIdList.imgUrl),
           ListTile(
             title: Text(getIdList.title),
             trailing: IconButton(onPressed: (){
               getCartData.addItem(getIdList.id, getIdList.title, getIdList.price, getIdList.imgUrl) ;

             }, icon: Icon(Icons.add_shopping_cart_outlined)),
           )
         ,  ListTile(
             title: Text('${getIdList.price} JD' ),

           )
         ],
       ));
  }
}
