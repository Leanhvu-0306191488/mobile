import 'package:doan/repository/api.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/Account.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AccountProvider with ChangeNotifier {
  List<Account> _accounts = [];
  bool loading = false;
  List<Account> get accounts => _accounts;

  login(email, password) async {
    loading = true;
    _accounts = await Login(email, password);
    loading = false;
    notifyListeners();
  }

  Future<List<Account>> getAllAccount() async {
    List responseList = [];
    final response = await http.get(
      Uri.parse('http://localhost:3000/accounts'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      responseList = json.decode(response.body);
    }
    return responseList.map((data) => Account.fromJson(data)).toList();
  }

  Account AccountFromJson(String str) {
    final jsonData = json.decode(str);
    return Account.fromJson(jsonData);
  }

  Future<Account> getAccount(int id) async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/accounts/$id'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      return AccountFromJson(json.decode(response.body));
    }
    return AccountFromJson("0");
  }

  Future<Account> _loginCustomer(String email, String password) async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/accounts'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      return AccountFromJson(json.decode(response.body));
    }
    return AccountFromJson("0");
  }

  List<Account> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Account>((json) => Account.fromJson(json)).toList();
  }

  Future<List<Account>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/accounts'));
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
