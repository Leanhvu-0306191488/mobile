import 'package:doan/components/custom_suffix_icon.dart';
import 'package:doan/components/default_button.dart';
import 'package:doan/components/form_error.dart';
import 'package:doan/components/social_card.dart';
import 'package:doan/constants.dart';
import 'package:doan/provider/Account_Provider.dart';
import 'package:doan/screens/dang_nhap/components/FormHelper.dart';
import 'package:doan/screens/dang_nhap/sign_in_screen.dart';
import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Form.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String password = "";
  String email = "";
  String address = "";
  String phone = "";
  String username = "";
  String fullname = "";
  bool hidePassword = true;
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
          UsernameForm(context, username),
          EmailForm(context, email),
          PasswordForm(context),
          FullnameForm(context, fullname),
          AddressForm(context, address),
          PhoneForm(context, phone),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.saveButton(
              "Register",
              () async {
                if (validateAndSave()) {
                  Navigator.pushNamed(context, SignInScreen.routeName);
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
