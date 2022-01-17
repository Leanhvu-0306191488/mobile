import 'package:doan/components/product_card.dart';
import 'package:doan/constants.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> category = ["loai 1", "loai 2", "loai 3", "Loai 4"];
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              category[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: select == index ? Colors.black : Colors.grey[700],
              ),
            ),
            Container(
              height: 2,
              width: 30,
              color: select == index ? Colors.black : Colors.transparent,
              margin: EdgeInsets.only(top: 5.0),
            )
          ],
        ),
      ),
    );
  }
}
