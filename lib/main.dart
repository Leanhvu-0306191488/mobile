import 'package:doan/constants.dart';
import 'package:doan/provider/Account_Provider.dart';
import 'package:doan/screens/splash/splash_screen.dart';
import 'package:doan/screens/thong_tin_ca_nhan/profile_screen.dart';
import 'package:doan/theme.dart';
import 'package:flutter/material.dart';
import 'package:doan/provider/cart_provider.dart';
import 'package:doan/provider/Product_provider.dart';
import 'package:doan/provider/Favorite_provider.dart';
import 'package:doan/routs.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProviders()),
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => AccountProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          //home: SplashScreen(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ));
  }
}
