import 'package:doan/components/custom_bottom_nav_bar.dart';
import 'package:doan/components/default_button.dart';
import 'package:doan/constants.dart';
import 'package:doan/enums.dart';
import 'package:doan/models/Cart.dart';
import 'package:doan/screens/danh_sach_yeu_thich/components/body.dart';
import 'package:doan/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favorite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Danh sách Yêu thích",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class CheckOutCart extends StatelessWidget {
  const CheckOutCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
    );
  }
}
