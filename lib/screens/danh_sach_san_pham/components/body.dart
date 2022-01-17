import 'package:doan/components/product_card.dart';
import 'package:doan/constants.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/screens/danh_sach_san_pham/Products_screen.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doan/screens/danh_sach_san_pham/components/categories.dart';
import 'package:doan/screens/chi_tiet_san_pham/details_screen.dart';
import 'package:doan/screens/danh_sach_san_pham/components/item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Shore", style: Theme.of(context).textTheme.headline5)),
        Category(),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                  itemCount: demoProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => Item(
                        press: () => Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          // arguments: ProductDetailsArguments(
                          //     product: demoProducts[index]),
                        ),
                        product: demoProducts[index],
                      ))),
        ),
      ],
    );
  }
}
