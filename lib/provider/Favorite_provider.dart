import 'package:doan/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:doan/models/Favorite.dart';

class FavoriteProvider with ChangeNotifier {
  List<Favorite> _favorites = [];

  List<Favorite> get favorites => _favorites;

  Future<void> fetchData() async {
    List<Favorite> favorites = await [];
    _favorites = favorites;
  }

  void removeAllCart() {
    _favorites = [];
    notifyListeners();
  }

  void addProduct(Product products) {
    _favorites.add(
      Favorite(product: products),
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
