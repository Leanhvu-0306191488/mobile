import 'package:doan/components/rounded_icon_btn.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final rating = 4.5;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Product>.value(
        value: ModalRoute.of(context)!.settings.arguments as Product,
        child: Consumer<Product>(builder: (context, loadedProduct, _) {
          return Scaffold(
            backgroundColor: Color(0xFFF5F6F9),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: CustomAppBar(rating: rating),
            ),
            body: Body(
              product: loadedProduct,
            ),
          );
        }));
  }
}
// return Scaffold(
//       backgroundColor: Color(0xFFF5F6F9),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(AppBar().preferredSize.height),
//         child: CustomAppBar(rating: rating),
//       ),
//       body: Body(
//         product: [Product.fromJson(json)],
//       ),
//     );