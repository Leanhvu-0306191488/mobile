import 'package:doan/models/Favorite.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({Key? key, required this.favorite}) : super(key: key);

  final Favorite favorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(favorite.product.images.toString()),
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        Column(
          children: [
            Text(
              favorite.product.name,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
          ],
        )
      ],
    );
  }
}
