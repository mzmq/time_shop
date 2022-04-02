import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

import '../providers/products_provider.dart';
import '../screens/home_page_screen.dart';
import '../widgets/grid_tile_widget.dart';

class GridViewBuildWidget extends StatelessWidget {
  bool isFav ;
   GridViewBuildWidget({Key? key , required this.isFav }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<ProductProvider>(context);
    final getListProducts =isFav? getData.favItem : getData.item;
    return getListProducts.length == 0  ?  Container(
      child: Center(
        child: Badge(
            elevation: 10,
            shape: BadgeShape.circle,
            badgeContent:  IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomePageScreen()));
            }, icon: const Icon(Icons.add_outlined ,  color: Colors.white)),
         child: Icon(Icons.favorite_border_outlined , size: 150 , color: Colors.red.withOpacity(0.4))),
      ),
    ):GridView.builder(
        itemCount: getListProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value: getListProducts[i] ,child:   GridTileWidget() ,)

         );
  }
}
