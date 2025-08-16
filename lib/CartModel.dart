import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(String name, double price) {
    _items.add({'name': name, 'price': price, 'quantity': 1});
    notifyListeners();
  }

  void updateQuantity(int index, int quantity) {
    _items[index]['quantity'] = quantity;
    notifyListeners();
  }

  double calculateTotal() {
    return _items.fold(
        0.0, (sum, item) => sum + item['price'] * item['quantity']);
  }
}
