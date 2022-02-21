import 'package:doan/models/Product.dart';
import 'package:doan/screens/Payment/Payment_screen.dart';
import 'package:doan/screens/Payment/components/Pay.dart';
import 'package:doan/screens/chi_tiet_san_pham/details_screen.dart';
import 'package:doan/screens/complete_profile/complete_profile_screen.dart';
import 'package:doan/screens/dang_ky/sign_up_screen.dart';
import 'package:doan/screens/dang_nhap/sign_in_screen.dart';
import 'package:doan/screens/gio_hang/cart_screen.dart';
import 'package:doan/screens/quen_mat_khau/forgot_password_screen.dart';
import 'package:doan/screens/danh_sach_yeu_thich/favorite_list_screen.dart';
import 'package:doan/screens/thong_tin_ca_nhan/profile_screen.dart';
import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:doan/screens/splash/splash_screen.dart';
import 'package:doan/screens/dang_nhap/sign_in_screen.dart';
import 'package:doan/screens/lich_su_mua_hang/my_order_screen.dart';
import 'package:doan/screens/danh_sach_san_pham/Products_screen.dart';
import 'package:doan/screens/Profile/Profile.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpscreen.routeName: (context) => SignUpscreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MyOrder.routeName: (context) => MyOrder(),
  Products.routeName: (context) => Products(),
  SignUpscreen.routeName: (context) => SignUpscreen(),
  PayScreen.routeName: (context) => PayScreen(),
  Pay.routeName: (context) => Pay(),
};
