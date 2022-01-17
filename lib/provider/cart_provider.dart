import 'package:doan/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/Cart.dart';

class CartProviders with ChangeNotifier {
  List<Cart> _carts = [];

  List<Cart> get carts => _carts;

  Future<void> fetchData() async {
    List<Cart> carts = await [];
    _carts = carts;
  }

  void removeAllCart() {
    _carts = [];
    notifyListeners();
  }

  void addProduct(Product products) {
    _carts.add(
      Cart(
        product: products,
        quantity: 1,
      ),
    );
    notifyListeners();
  }

  // void removeAtCart(int id) {
  //   for (int itemcount = 0; itemcount < _carts.length; itemcount++) {
  //     Cart item = _carts[itemcount];
  //     if (item.product.id == id) {
  //       _carts.removeAt(itemcount);
  //       break;
  //     }
  //     notifyListeners();
  //   }
  // }
}
