import 'package:doan/components/custom_suffix_icon.dart';
import 'package:doan/components/default_button.dart';
import 'package:doan/components/form_error.dart';
import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileFrom extends StatefulWidget {
  @override
  _CompleteProfileFromState createState() => _CompleteProfileFromState();
}

class _CompleteProfileFromState extends State<CompleteProfileFrom> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? sdt;
  String? diachi;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.remove(error!);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildLastNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPhoneNumberFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DefaultButton(
            text: "Tiếp tục",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => diachi = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kAddressNullError);
          });
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Địa chỉ",
        hintText: "Nhập địa chỉ của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Location point.svg",
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => sdt = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Số điện thoại ",
        hintText: "Nhập số điện thoại của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kLastNamelNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kLastNamelNullError);
          });
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Tên ",
        hintText: "Nhập tên của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kNamelNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kNamelNullError);
          });
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Họ ",
        hintText: "Nhập họ của bạn",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
    );
  }
}
