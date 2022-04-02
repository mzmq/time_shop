import 'package:flutter/material.dart';

class Products with ChangeNotifier{
  final id;

  final title;
  final sunTitle ;
  final price;

  bool isFav;

  final imgUrl;

  Products({
    @required this.id,
    @required  this.title,
    @required  this.sunTitle ,
    @required  this.price,
    @required this.imgUrl,
    this.isFav = false ,
  });

  void ChangeIsLike (){
    isFav = !isFav ;
    notifyListeners();
  }
}
