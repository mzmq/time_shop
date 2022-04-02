import 'package:flutter/foundation.dart';

import '../models/products.dart';

class ProductProvider with ChangeNotifier {
  final List<Products> _item = [
    Products(id: 'p1', title: 'Product1',sunTitle: 'this is subTitle 1 ' ,price:  50.0 , imgUrl: 'https://cdn.pixabay.com/photo/2022/02/17/18/22/petal-7019265_960_720.jpg' ),
    Products(id: 'p2', title: 'Product2',sunTitle: 'this is subTitle 2 ' ,price:  99.9 , imgUrl: 'https://cdn.pixabay.com/photo/2016/03/27/07/12/apple-1282241_960_720.jpg' ),
    Products(id: 'p3', title: 'Product3',sunTitle: 'this is subTitle 3 ' ,price:  10.50 , imgUrl: 'https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_960_720.jpg' ),
    Products(id: 'p4', title: 'Product4',sunTitle: 'this is subTitle 4 ' ,price:  9.0 , imgUrl: 'https://cdn.pixabay.com/photo/2015/05/31/15/07/coffee-792113_960_720.jpg' ),
    Products(id: 'p5', title: 'Product5',sunTitle: 'this is subTitle 5 ' ,price:  250.0 , imgUrl: 'https://cdn.pixabay.com/photo/2015/01/21/14/14/apple-606761_960_720.jpg' ),
  ];

  List<Products> get item {
    return [..._item];
  }
  List<Products> get favItem {
    return _item.where((element) => element.isFav).toList();
  }
}
