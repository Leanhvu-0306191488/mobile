import 'package:flutter/material.dart';
import 'components/Payment.dart';

class PayScreen extends StatelessWidget {
  static String routeName = "/Payment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PayMent"),
      ),
      body: Payment(),
    );
  }
}
