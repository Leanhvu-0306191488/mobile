import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:doan/components/custom_suffix_icon.dart';
import 'package:doan/components/default_button.dart';
import 'package:doan/components/form_error.dart';
import 'package:doan/models/Account.dart';
import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:doan/screens/quen_mat_khau/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../../size_config.dart';
import 'FormHelper.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String password = "";
  String email = "";
  bool hidePassword = true;
  bool checkLogin = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        key: _formKey,
        body: LoginSetUp(context),
      ),
    );
  }

  Widget LoginSetUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: globalKey,
          child: Login(context),
        ),
      ),
    );
  }

  Widget Header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.redAccent,
              Colors.redAccent,
            ],
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/Profile Image.png",
              fit: BoxFit.cover,
              width: 140,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget EmailForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, top: 20),
      child: FormHelper.inputFieldWidget(
        context,
        Icon(Icons.verified_user),
        "email",
        "Email",
        (onValidateVal) {
          if (onValidateVal.isEmpty) {
            return "Chưa Nhập Email";
          }
          return null;
        },
        (onSaveval) {
          email = onSaveval.toString().trim();
        },
      ),
    );
  }

  Widget PasswordForm(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20, top: 20),
        child: FormHelper.inputFieldWidget(
          context,
          Icon(Icons.verified_user),
          "password",
          "Password",
          (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "Chưa Nhập Mât Khẩu";
            }
            return null;
          },
          (onSaveval) {
            password = onSaveval.toString().trim();
          },
          initialValue: "",
          osbcureText: hidePassword,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.redAccent,
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility)),
        ));
  }

  Widget CheckLogin(
      BuildContext context, String dataemail, String datapassword) {
    return GestureDetector(onTap: () {
      setState(() {
        if (email == dataemail && password == datapassword) {
          setState(
            () => Navigator.pushNamed(context, HomeScreen.routeName),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Tài Khoản Hoặc Mật Khẩu Bị Sai"),
              );
            },
          );
        }
      });
    });
  }

  Widget LoginCheck(BuildContext context, String email, String password) {
    return FutureBuilder<List<Account>>(
      future: _getAllAccount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Account>? data = snapshot.data;
          return Column(
            children: [
              ...List.generate(
                data!.length,
                (index) {
                  return CheckLogin(
                      context, data[index].email, data[index].password);
                },
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget Login(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(context),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, top: 40),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          EmailForm(context),
          PasswordForm(context),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.saveButton(
              "Login",
              () {
                if (validateAndSave()) {
                  LoginCheck(context, email, password);
                }
              },
            ),
          ),
        ]);
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

Future<List<Account>> _getAllAccount() async {
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
