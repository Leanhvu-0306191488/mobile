import 'dart:convert';
import 'dart:io';

import 'package:doan/components/product_card.dart';
import 'package:doan/constants.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/screens/trangchinh/components/categories.dart';
import 'package:doan/screens/trangchinh/components/icon_btn_with_counter.dart';
import 'package:doan/screens/trangchinh/components/popular_products.dart';
import 'package:doan/screens/trangchinh/components/search_field.dart';
import 'package:doan/screens/trangchinh/components/special_offers.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
