import 'package:flutter/foundation.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItem = {};

  Map<String, Cart> get cartItem {
    return {..._cartItem};
  }

  double get TotalPrice {
    double Total = 0.0 ;
    _cartItem.forEach((key, value) {

      Total += value.Price * value.amount;

    }) ;
    return Total ;

  }

  int get CartCount {

    return _cartItem == null ? 0 :   _cartItem.length ;
  }


  void addItem(String id, String title, double price, String imgUrl) {
    if (_cartItem.containsKey(id)) {
//update
      _cartItem.update(
          id,
              (value) => Cart(
              id: value.id,
              title: value.title,
              amount: value.amount + 1,
              Price: value.Price,
              imgUrl: value.imgUrl));
    } else {

      // add new item

      _cartItem.putIfAbsent(
          id,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              amount: 1,
              Price: price,
              imgUrl: imgUrl));
    }
    notifyListeners();
  }

  void ClearList (){

    _cartItem = {};
    notifyListeners() ;

  }


}
