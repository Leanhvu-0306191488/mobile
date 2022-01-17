import 'package:doan/components/default_button.dart';
import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.5,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Đăng nhập thành công",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Quay về trang chính",
            press: () => Navigator.pushNamed(context, HomeScreen.routeName),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
