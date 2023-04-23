import 'package:fastfoodapp/utils/httpUtil.dart';

class HomeController {
  final httpUtil = HttpUtil();

  getDishes(int page) async {
    final response = await httpUtil.httpGet("/products/${page}");
    return response;
  }

  getCategories() async {
    final response = await httpUtil.httpGet("/categories");
    return response;
  }
}
