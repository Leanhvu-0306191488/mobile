import 'package:doan/screens/dang_ky/sign_up_screen.dart';
import 'package:doan/screens/dang_nhap/sign_in_screen.dart';
import 'package:doan/screens/quen_mat_khau/forgot_password_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bạn chưa có tài khoản?",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpscreen.routeName),
          child: Text(
            "Đăng ký",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
