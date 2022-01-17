import 'dart:ui';

import 'package:doan/constants.dart';
import 'package:doan/models/Cart.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/provider/cart_provider.dart';

import 'package:doan/screens/gio_hang/components/cart_item_card.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  //Provider.of trả về 1 object
  List<Cart> carts = [];
  //Consumer trả 1 wigdet

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    Provider.of<CartProviders>(context, listen: false);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    carts = Provider.of<CartProviders>(context).carts;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(carts[index].product.id.toString()),
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
                carts.removeAt(index);
              });
            },
            child: CartItemCard(cart: carts[index]),
          ),
        ),
      ),
    );
  }
}
