import 'dart:ui';

import 'package:doan/constants.dart';
import 'package:doan/models/Favorite.dart';
import 'package:doan/provider/Favorite_provider.dart';
import 'package:doan/screens/danh_sach_yeu_thich/components/favoritelist_item_card.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Favorite> favorites = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    Provider.of<FavoriteProvider>(context, listen: false);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    favorites = Provider.of<FavoriteProvider>(context).favorites;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(favorites[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                favorites.removeAt(index);
              });
            },
            child: FavoriteItemCard(favorite: favorites[index]),
          ),
        ),
      ),
    );
  }
}
