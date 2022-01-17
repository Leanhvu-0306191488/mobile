import 'package:doan/components/custom_bottom_nav_bar.dart';
import 'package:doan/constants.dart';
import 'package:doan/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doan/screens/loai_san_pham/product_type.dart';
import 'components/body.dart';
import 'package:doan/screens/gio_hang/cart_screen.dart';

class Products extends StatelessWidget {
  static String routeName = "/Products";
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: Body(),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pushNamed(context, ProductType.routeName),
        icon: SvgPicture.asset("assets/icons/Back ICon.svg"),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/Search Icon.svg",
            color: kTextColor,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
          icon: SvgPicture.asset(
            "assets/icons/Cart Icon.svg",
            color: kTextColor,
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
