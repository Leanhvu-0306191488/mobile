import 'dart:convert';

import 'package:flutter/material.dart';

class Account {
  int id;
  String fullName;
  String password;
  String email;
  String address1;
  String address2;
  String phone;
  String avatar;
  bool isAdmin;
  bool status;

  Account({
    required this.id,
    required this.fullName,
    required this.password,
    required this.email,
    required this.address1,
    required this.address2,
    required this.phone,
    required this.avatar,
    required this.isAdmin,
    required this.status,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json['id'],
        fullName: json['fullName'],
        password: json['password'],
        email: json['email'],
        address1: json['address1'],
        address2: json['address2'],
        phone: json['phone'],
        avatar: json['avatar'],
        isAdmin: json['isAdmin'],
        status: json['status'],
      );
}

List<Account> demoAccount = [
  Account(
    id: 1,
    fullName: "1",
    password: "Lelongtoan123",
    email: "toanle0120@gmail.com",
    address1: "1",
    address2: "1",
    phone: "1",
    avatar: "assets/images/nikeair1.jfif",
    isAdmin: false,
    status: true,
  ),
];
