import 'dart:convert';

import 'package:flutter/material.dart';

class Account {
  int id;
  String username;
  String password;
  String email;
  String fullname;
  String address;
  String phone;
  String avatar;
  bool isAdmin;
  bool status;

  Account({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.fullname,
    required this.address,
    required this.phone,
    required this.avatar,
    required this.isAdmin,
    required this.status,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        fullname: json['fullname'],
        address: json['address'],
        phone: json['phone'],
        avatar: json['avatar'],
        isAdmin: json['isAdmin'],
        status: json['status'],
      );
}
