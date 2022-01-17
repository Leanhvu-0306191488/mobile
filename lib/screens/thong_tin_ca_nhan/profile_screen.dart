import 'package:doan/components/custom_bottom_nav_bar.dart';
import 'package:doan/constants.dart';
import 'package:doan/enums.dart';
import 'package:doan/screens/thong_tin_ca_nhan/components/body.dart';
import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(child: Body()),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
