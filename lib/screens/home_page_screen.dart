import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:time_shop/screens/cart_screen.dart';
import 'package:time_shop/widgets/btn_cart_widget.dart';
import '../providers/cart_provider.dart';
import '../widgets/grid_view_build_widget.dart';

enum isFav { All, Fav }

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool _Fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [

          BtnCartWidget(),
          PopupMenuButton(
              onSelected: (isFav selected) {
                setState(() {
                  if (selected == isFav.Fav) {
                    print(selected);
                    _Fav = true;
                  } else {
                    print(selected);
                    _Fav = false;
                  }
                });
              },
              itemBuilder: (ctx) => [
                PopupMenuItem(child: Text('All'), value: isFav.All),
                PopupMenuItem(child: Text('Favorites'), value: isFav.Fav),
              ]) ,

          SizedBox(width: 5,)
        ],
      ),
      body: GridViewBuildWidget(isFav: _Fav),
    );
  }
}
