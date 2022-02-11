import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier {
  Map<int, int> _stock = {};
  Map<int, int> _quantity = {};
  //Getters
  Map<int, int> get stock => _stock;
  Map<int, int> get quantity => _quantity;
  int get stockCount => _stock.length;
  int get count => _stock.length > 0 ? _stock.values.reduce((a, b) => a + b) : 0;

  void addToStock(index, quantity) {
    if (_stock.containsKey(index)) {
      _stock[index] += 1;
    } else {
      _stock[index] = 1;
    }
    if (_quantity.containsKey(quantity)) {
      _quantity[quantity] += 1;
    } else {
      _quantity[quantity] = 1;
    }
    notifyListeners();
  }

  void minusToStock(index, quantity) {
    if (_stock.containsKey(index)) {
      _stock[index] -= 1;
    } else {
      _stock[index] = 1;
    }
    if (_quantity.containsKey(quantity)) {
      _quantity[quantity] -= 1;
    } else {
      _quantity[quantity] = 1;
    }
    notifyListeners();
  }

  void clear(index) {
    if (_stock.containsKey(index)) {
      _stock.remove(index);
      notifyListeners();
    }
  }
}
