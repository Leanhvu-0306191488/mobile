import 'package:doan/components/custom_suffix_icon.dart';
import 'package:doan/components/default_button.dart';
import 'package:doan/components/form_error.dart';
import 'package:doan/components/social_card.dart';
import 'package:doan/constants.dart';
import 'package:doan/provider/Account_Provider.dart';
import 'package:doan/screens/dang_nhap/components/FormHelper.dart';
import 'package:doan/screens/trangchinh/home_screen.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget EmailForm(BuildContext context, email) {
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

Widget FullnameForm(BuildContext context, fullname) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, top: 20),
    child: FormHelper.inputFieldWidget(
      context,
      Icon(Icons.verified_user),
      "fullname",
      "Fullname",
      (onValidateVal) {
        if (onValidateVal.isEmpty) {
          return "Chưa Nhập Fullname";
        }
        return null;
      },
      (onSaveval) {
        fullname = onSaveval.toString().trim();
      },
    ),
  );
}

Widget PhoneForm(BuildContext context, phone) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, top: 20),
    child: FormHelper.inputFieldWidget(
      context,
      Icon(Icons.verified_user),
      "phone",
      "Phone",
      (onValidateVal) {
        if (onValidateVal.isEmpty) {
          return "Chưa Nhập Phone";
        }
        return null;
      },
      (onSaveval) {
        phone = onSaveval.toString().trim();
      },
    ),
  );
}

//username
Widget UsernameForm(BuildContext context, username) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, top: 20),
    child: FormHelper.inputFieldWidget(
      context,
      Icon(Icons.verified_user),
      "username",
      "Username",
      (onValidateVal) {
        if (onValidateVal.isEmpty) {
          return "Chưa Nhập Username";
        }
        return null;
      },
      (onSaveval) {
        username = onSaveval.toString().trim();
      },
    ),
  );
}

Widget AddressForm(BuildContext context, address) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, top: 20),
    child: FormHelper.inputFieldWidget(
      context,
      Icon(Icons.verified_user),
      "address",
      "Address",
      (onValidateVal) {
        if (onValidateVal.isEmpty) {
          return "Chưa Nhập Address";
        }
        return null;
      },
      (onSaveval) {
        address = onSaveval.toString().trim();
      },
    ),
  );
}
