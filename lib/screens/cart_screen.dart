import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';
import '../screens/order_screen.dart';
import '../providers/cart_provider.dart' as Cart;


class CartScreen extends StatelessWidget {
 const  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getDataOrder = Provider.of<OrderProvider>(context) ;
    final getDataCart = Provider.of<Cart.CartProvider>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<Cart.CartProvider>(
        builder: (context, value, child) => Column(
          children: [
            ListTile(
              title: Chip(
                backgroundColor: Colors.blue,
                label: Text('${value.TotalPrice.toStringAsFixed(2)} JD',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              leading: Text('Total',
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
              trailing: TextButton.icon(
                  onPressed: () {

                    if(getDataCart.TotalPrice > 0){
                      getDataOrder.addOrder(value.cartItem.values.toList(), value.TotalPrice) ;

                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> OrderScreen() ));
                      value.ClearList() ;
                    } else {
                    return;
                    }


                  },
                  icon: Icon(Icons.credit_card_outlined),
                  label: Text('ORDER NOW')),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: value.cartItem.length,
                    itemBuilder: (ctx, i) => Card(
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                value.cartItem.values.toList()[i].imgUrl),
                          ),
                          title: Row(
                            children: [
                              Text(
                                  '${value.cartItem.values.toList()[i].title}'),
                              SizedBox(
                                width: 10,
                              ),
                              Chip(
                                  elevation: 10,
                                  backgroundColor: Colors.blue,
                                  label: Text(
                                    'Total ${(value.cartItem.values.toList()[i].Price * value.cartItem.values.toList()[i].amount).toStringAsFixed(2)}',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                          subtitle: Text(
                              'price ${value.cartItem.values.toList()[i].Price}'),
                          trailing: Text(
                            '${value.cartItem.values.toList()[i].amount}X',
                            style: TextStyle(fontSize: 30, color: Colors.grey),
                          ),
                        ))))
          ],
        ),
      ),
    );
  }
}
