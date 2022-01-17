
import 'package:doan/models/Product.dart';

class Cart {
  final Product product;
  final int quantity;

  Cart({required this.product, required this.quantity});
}


// // class Cart {
// //   final Product product;
// //   final int quantity;

// //   Cart({required this.product, required this.quantity});
// // }

// class Cart with ChangeNotifier {
//   List<Product> _products = [];

//   dynamic _totalPrice = 0.0;

//   void add(Product item) {
//     _products.add(item);
//     _totalPrice += item.price;
//     notifyListeners();
//   }

//   void remove(Product item) {
//     _totalPrice -= item.price;
//     _products.remove(item);
//     notifyListeners();
//   }

//   int get count {
//     return _products.length;
//   }

//   dynamic get totalPrice {
//     return _totalPrice;
//   }

//   List<Product> get cartItems {
//     return _products;
//   }
// }
