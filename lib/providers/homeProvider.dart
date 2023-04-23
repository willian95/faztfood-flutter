import 'package:fastfoodapp/controllers/homeController.dart';
import 'package:fastfoodapp/models/productModel.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int _currentPage = 1;
  int _lastPage = 0;
  List<Product> _products = [];
  HomeController homeController = HomeController();
  int _selectedCategory = 0;
  String _search = "";

  getProducts() async {
    final response = await homeController.getDishes(_currentPage);

    for (Map<String, dynamic> data in response["data"]["data"]) {
      _products.add(Product(
          id: data["ID"],
          createdAt: data["CreatedAt"],
          updatedAt: data["UpdatedAt"],
          deletedAt: data["DeletedAt"],
          name: data["name"],
          picture: data["picture"],
          description: data["description"],
          subtitle: data["subtitle"],
          price: data["price"].toDouble(),
          rating: data["rating"].toDouble()));
    }

    _lastPage = response["data"]["totalPages"];

    notifyListeners();
    return _products;
  }

  List<Product> get getProductsList => _products;
  int get currentPage => _currentPage;
  int get selectedCategory => _selectedCategory;
  int get lastPage => _lastPage;
  String get search => _search;

  setSelectedCategory(int selectedCategory) {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }

  setSearch(String search) {
    _search = search;
    notifyListeners();
  }
}
