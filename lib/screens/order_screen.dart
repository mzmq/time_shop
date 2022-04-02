import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_shop/widgets/order_list_widget.dart';

import '../providers/order_provider.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getDateOrder = Provider.of<OrderProvider>(context).Order ;
    return Scaffold(

      appBar: AppBar(
       title: Text('Order'),
      ),
body: ListView.builder(
    itemCount: getDateOrder.length,
    itemBuilder: (ctx , i )=> OrderListWidget(order: getDateOrder[i]),
    ),
    );
  }
}
