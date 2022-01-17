import 'package:flutter/material.dart';
import 'package:doan/models/Product.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

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

  Product ProductFromJson(String str) {
    final jsonData = json.decode(str);
    return Product.fromJson(jsonData);
  }

  Future<Product> _getProduct(int id) async {
    final response = await http.get(
      Uri.parse('http://192.168.1.2:8000/api/products/$id'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      return ProductFromJson(json.decode(response.body));
    }
    return ProductFromJson("0");
  }
}
