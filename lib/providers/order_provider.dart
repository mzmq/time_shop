import 'package:flutter/foundation.dart';

import '../models/cart.dart';
import '../models/order.dart';

class OrderProvider with ChangeNotifier {
  List<OrderItem> _order = [] ;
  List<OrderItem> get Order {
    return [..._order] ;
  }

  void addOrder (List<Cart> products ,double  amount){
    _order.insert(0, OrderItem(id: DateTime.now().toString(), products: products, amount: amount, dateTime: DateTime.now()));

  }
  void deleteOrder (){
_order = [] ;
notifyListeners() ;
  }

}