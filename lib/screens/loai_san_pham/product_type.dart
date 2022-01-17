import 'package:doan/screens/trangchinh/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:doan/screens/danh_sach_san_pham/Products_screen.dart';
import '../../size_config.dart';

class ProductType extends StatelessWidget {
  static String routeName = "/product_type";
  List<Type> types = [
    Type(1, 'Giay ABC', 'public', true),
    Type(1, 'Giay ABC', 'public', true),
    Type(1, 'Giay ABC', 'public', true),
    Type(1, 'Giay ABC', 'public', true),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loại sản phẩm"),
      ),
      body: GridView.count(
        childAspectRatio: 1.25,
        crossAxisCount: 2,
        children: types.map((item) {
          return TypeItem(
            item: item,
            press: () => Navigator.pushNamed(context, Products.routeName),
          );
        }).toList(),
      ),
    );
  }
}

class TypeItem extends StatelessWidget {
  const TypeItem({Key? key, required this.press, required this.item})
      : super(key: key);
  final Type item;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      splashColor: Colors.blueGrey,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 10,
        shadowColor: Colors.blueGrey,
        child: Container(
          color: item.status ? Colors.blue.shade200 : Colors.grey,
          alignment: Alignment.center,
          child: Text(
            item.name,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Type {
  int id;
  String name;
  String type;
  bool status;
  Type(this.id, this.name, this.type, this.status);
}
