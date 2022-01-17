import 'dart:convert';
import 'dart:io';

import 'package:doan/components/product_card.dart';
import 'package:doan/models/Product.dart';
import 'package:doan/screens/chi_tiet_san_pham/details_screen.dart';
import 'package:doan/screens/trangchinh/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  PopularProducts({
    Key? key,
  }) : super(key: key);
  final isPopular = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? data = snapshot.data;
          return Column(
            children: [
              SectionTitle(text: "Popular Product", press: () {}),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(data!.length, (index) {
                      return ProductCard(
                        product: data[index],
                        press: () => Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments: data[index],
                        ),
                      );
                    }),
                    SizedBox(width: getProportionateScreenWidth(20))
                  ],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Product>> _getAllProduct() async {
    List responseList = [];
    final response = await http.get(
      Uri.parse('http://192.168.1.2:8000/api/products'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      responseList = json.decode(response.body);
    }
    return responseList.map((data) => Product.fromJson(data)).toList();
  }
}
