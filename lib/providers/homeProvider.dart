import 'package:fastfoodapp/models/productModel.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _currentPage = 1;
  int _lastPage = 0;
  List<Product> _products = [];

  setProducts(List<Product> products, int lastPage) {
    _products = products;
    _lastPage = lastPage;
    notifyListeners();
  }

  List<Product> getProducts() {
    return _products;
  }
}
