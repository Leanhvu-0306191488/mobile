import 'package:doan/components/custom_suffix_icon.dart';
import 'package:doan/components/default_button.dart';
import 'package:doan/components/form_error.dart';
import 'package:doan/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                "Hoàn thành thông tin",
                style: headingStyle,
              ),
              Text(
                "Hoàn thành thông tin của bạn \nđể bắt đầu mua sắm",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              CompleteProfileFrom(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                "Tiếp tục đồng nghĩa với viêc bạn đồng ý \nvới các điều khoản của GREY.B",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
