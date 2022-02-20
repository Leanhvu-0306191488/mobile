import 'package:doan/models/Account.dart';
import 'package:doan/models/Categories.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/Product.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<List<Product>> getAllProduct(context) async {
  List responseList = [];
  final response = await http.get(
    //http://192.168.85.167:8000/api/products
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

Future<List<Category>> getAllCategory(context) async {
  List responseList = [];
  final response = await http.get(
    Uri.parse('http://192.168.1.2:8000/api/producttype'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    },
  );
  if (response.statusCode == 200) {
    responseList = json.decode(response.body);
  }
  return responseList.map((data) => Category.fromJson(data)).toList();
}

Future<List<Account>> Login(email, password) async {
  List responseList = [];
  final response = await http.post(
    Uri.parse(
        'http://192.168.1.9:8000/api/accounts/login?email=$email&password=$password'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    },
  );
  // body: jsonEncode(<String, String>{'email': email, 'password': password}));
  if (response.statusCode == 200) {
    //var jsonString = response.body;
    //Account accounts = Account.fromJson(json.decode(jsonString));
    //return accounts.status==1?true:false;
    responseList = json.decode(response.body);
  }
  //return false;
  return responseList.map((data) => Account.fromJson(data)).toList();
}
