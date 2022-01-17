import 'package:doan/models/Categories.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier {
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  Future<List<Category>> _getAllCategory() async {
    List responseList = [];
    final response = await http.get(
      Uri.parse('http://192.168.1.2:8000/api//producttype'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      responseList = json.decode(response.body);
    }
    return responseList.map((data) => Category.fromJson(data)).toList();
  }
}
