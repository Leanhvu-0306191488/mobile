import 'package:doan/components/product_card.dart';
import 'package:doan/constants.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/screens/danh_sach_san_pham/Products_screen.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doan/screens/danh_sach_san_pham/components/categories.dart';
import 'package:doan/screens/chi_tiet_san_pham/details_screen.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.press, required this.product})
      : super(key: key);
  final Product product;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                product.images,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              product.name,
              style: TextStyle(color: kTextColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
