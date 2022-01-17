import 'package:doan/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  ProductImages({
    Key? key,
    required this.imgpath,
  }) : super(key: key);
  final String imgpath;
  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.imgpath.toString()),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...List.generate(
        //       widget.product.images.length,
        //       (index) => buildSmallPreview(index),
        //     )
        //   ],
        // )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
        padding: EdgeInsets.all(getProportionateScreenHeight(8)),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPrimaryColor),
        ),
        child: Image.asset(widget.imgpath.toString()),
      ),
    );
  }
}
