import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order.dart';
import '../providers/order_provider.dart';

class OrderListWidget extends StatefulWidget {
  final OrderItem order;
   OrderListWidget({Key? key , required this.order}) : super(key: key);

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {

  bool _expand = false ;
  @override
  Widget build(BuildContext context) {
    final getDataOrder = Provider.of<OrderProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              title: Text('Total Order ${widget.order.amount.toStringAsFixed(2)}'),
              trailing: IconButton(onPressed: (){
                setState(() {
                  _expand = !_expand ;
                });
              }, icon: Icon(_expand ? Icons.expand_less : Icons.expand_more)),

            ),
            _expand?  Column(
              children:[
                Column(
                  children:  widget.order.products.map((e) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(e.imgUrl)),
                          title: Text(e.title),
                          subtitle: Text('${e.Price} JD'),
                          trailing: Column(
                            children: [
                              Text('${e.amount}X' , style: TextStyle(fontSize: 20 ,  color: Colors.grey)),
                              SizedBox(height: 5,),
                              Text('${(e.Price * e.amount).toStringAsFixed(2)} JD' , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold) ),
                            ],
                          ),
                        ),
                      ) ,

                      Divider(thickness: 3 , indent: 50 , endIndent: 60),

                    ],
                  )).toList(),
                ) ,
                ListTile(
                  trailing: Text('${widget.order.amount.toStringAsFixed(2)} JD' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ,)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text('Order Now')),
                      ElevatedButton(onPressed: (){

                        getDataOrder.deleteOrder() ;
                      }, child: Text('Delete Order')),
                    ],
                  ),
                )
              ],
            ) : Container() ,
          ],
        ),
      ),
    );
  }
}
