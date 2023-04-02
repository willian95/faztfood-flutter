import 'package:fastfoodapp/models/productModel.dart';
import 'package:fastfoodapp/utils/httpUtil.dart';

class HomeController {
  final httpUtil = HttpUtil();

  getDishes(int page) async {
    List<Product> products = [];
    final response = await httpUtil.httpGet("/products/${page}");

    for (Map<String, dynamic> data in response["data"]["data"]) {
      products.add(Product.fromJson(data));
    }

    return {
      "products": products,
      "page": response["data"]["page"],
      "lastPage": response["data"]["totalPages"]
    };
  }
}
