import '../models/cart.dart';

class OrderItem {
  String id ;
  List<Cart> products ;
  double amount ;
  DateTime dateTime ;

  OrderItem({required this.id , required this.products , required this.amount , required this.dateTime}) ;

}