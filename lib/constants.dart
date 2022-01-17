import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0277BD);
const KPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(microseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Vui lòng nhập Email của bạn";
const String kInvalidEmailError = "Email của bạn không hợp lệ";
const String kPassNullError = "Vui lòng nhập Password của bạn";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Mật khẩu không hợp lệ";
const String kNamelNullError = "Vui lòng nhập họ của bạn";
const String kLastNamelNullError = "Vui lòng nhập tên của bạn";
const String kPhoneNumberNullError = "Vui lòng nhập số điện thoại của bạn";
const String kAddressNullError = "Vui lòng nhập địa chỉ của bạn";

//0xFF0277BD
//0xFFFF7643
