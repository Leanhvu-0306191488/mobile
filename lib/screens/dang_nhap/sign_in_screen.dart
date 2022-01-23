import 'package:flutter/material.dart';
import 'components/sign_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ĐĂNG NHẬP"),
      ),
      body: SignForm(),
    );
  }
}
