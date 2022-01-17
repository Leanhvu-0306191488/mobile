import 'dart:convert';
import 'dart:io';

import 'package:doan/components/default_button.dart';
import 'package:doan/components/rounded_icon_btn.dart';
import 'package:doan/constants.dart';
import 'package:doan/models/Cart.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/provider/cart_provider.dart';
import 'package:doan/screens/chi_tiet_san_pham/components/color_dots.dart';
import 'package:doan/screens/chi_tiet_san_pham/components/product_description.dart';
import 'package:doan/screens/chi_tiet_san_pham/components/product_images.dart';
import 'package:doan/screens/chi_tiet_san_pham/components/top_rounded_container.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProviders>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(
            imgpath: product.images.toString(),
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: DefaultButton(
                            text: "Add to Cart",
                            press: () => cart.addProduct(product),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
