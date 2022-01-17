import 'package:doan/constants.dart';
import 'package:doan/screens/lich_su_mua_hang/my_order_screen.dart';
import 'package:doan/screens/thong_tin_ca_nhan/components/profile_menu.dart';
import 'package:doan/screens/thong_tin_ca_nhan/components/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "Tài Khoản",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Bill Icon.svg",
          text: "Lịch sử mua hàng",
          press: () => Navigator.pushNamed(context, MyOrder.routeName),
        ),
        ProfileMenu(
          icon: "assets/icons/Bell.svg",
          text: "Thông Báo",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Cài Đặt",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          text: "Trung tâm hỗ trợ",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text: "Đăng xuất",
          press: () {},
        ),
      ],
    );
  }
}
