import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/cart_provider.dart';
import '../screens/product_details_screen.dart';
import '../models/products.dart';

class GridTileWidget extends StatelessWidget {

  GridTileWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   final getProductProvider  = Provider.of<Products>(context) ;
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProductDetailsScreen(productId: getProductProvider.id,   ) )) ;
      },
      child: GridTile(
        header: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black54,
                child: Text('${getProductProvider.price} jd'),
              ),
            ),
          ],
        ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(getProductProvider.title),
            leading: IconButton(
                  onPressed: () {
                    getProductProvider.ChangeIsLike() ;
                  },
                  icon: Icon(
                    getProductProvider.isFav ? Icons.favorite :
                    Icons.favorite_border_rounded,
                    color: Colors.white,

                  )),

            trailing: Consumer<CartProvider>(
              builder: (context, value, child) =>IconButton(
                  onPressed: () {
                    value.addItem(getProductProvider.id, getProductProvider.title, getProductProvider.price, getProductProvider.imgUrl) ;
                  },
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  )) ,

            ),
          ),
          child: Image.network(
            getProductProvider.imgUrl, fit: BoxFit.cover,
          )),
    );
  }
}
