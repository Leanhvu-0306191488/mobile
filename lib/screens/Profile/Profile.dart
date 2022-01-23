import 'package:doan/components/custom_bottom_nav_bar.dart';
import 'package:doan/constants.dart';
import 'package:doan/enums.dart';
import 'package:doan/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doan/screens/loai_san_pham/product_type.dart';
import 'package:doan/screens/gio_hang/cart_screen.dart';

class Body extends StatelessWidget {
  static String routeName = '/Profile';
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: "Profile",
      home: EditPf(),
    );
  }
}

class EditPf extends StatefulWidget {
  EditPf({Key? key}) : super(key: key);

  @override
  _EditPfState createState() => _EditPfState();
}

class _EditPfState extends State<EditPf> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, ProductType.routeName),
          icon: SvgPicture.asset("assets/icons/Back ICon.svg"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 16,
          top: 25,
          right: 16,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: kTextColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10),
                            ),
                          ],
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/Profile Image.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: kTextColor,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("[FullName]", "FullName", false),
              buildTextField("[Email]", "Email", false),
              buildTextField("[Password]", "Password", true),
              buildTextField("[Address1]", "Address1", false),
              buildTextField("[Address2]", "Address2", false),
              buildTextField("[Phone]", "Phone", false),
              SizedBox(
                height: 35,
              ),
              Row(
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14, letterSpacing: 2.2, color: kTextColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool password) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 35.0,
      ),
      child: TextField(
        obscureText: password ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: password
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(
            bottom: 3.0,
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
