import 'package:doan/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:doan/provider/cart_provider.dart';
import 'package:doan/models/Cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

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
              child: Image.asset(cart.product.images.toString()),
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        Column(
          children: [
            Text(
              cart.product.name,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(color: kPrimaryColor),
                children: [
                  TextSpan(
                    text: " x${1}",
                    style: TextStyle(color: kTextColor),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
