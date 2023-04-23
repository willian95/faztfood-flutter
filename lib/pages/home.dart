import 'dart:convert';

import 'package:fastfoodapp/controllers/homeController.dart';
import 'package:fastfoodapp/models/productModel.dart';
import 'package:fastfoodapp/models/categoryModel.dart' as CategoryModel;
import 'package:fastfoodapp/providers/homeProvider.dart';
import 'package:fastfoodapp/utils/httpUtil.dart';
import 'package:fastfoodapp/widgets/categoryCard.dart';
import 'package:fastfoodapp/widgets/homeProductCard.dart';
import 'package:fastfoodapp/widgets/searchBoxWidget.dart';
import 'package:fastfoodapp/widgets/skeletons/categorySkeleton.dart';
import 'package:fastfoodapp/widgets/skeletons/productGridSkeleton.dart';
import 'package:fastfoodapp/widgets/skeletons/productSkeleton.dart';
import 'package:fastfoodapp/widgets/subtitlesWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();
  TextEditingController passwordController = TextEditingController();
  HomeController homeController = HomeController();
  final httpUtil = HttpUtil();
  List<Product> products = [];
  List<CategoryModel.Category> categories = [];
  late var productFuture;
  var categoriesFuture;
  bool isLoading = false;
  double _scrollPosition = 0.0;
  double _scrollTop = 0.0;
  bool hasPagination = true;
  int page = 1;
  int lastPage = 1;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _scrollController.addListener(_scrollListener);
    setState(() {
      productFuture =
          Provider.of<HomeProvider>(context, listen: false).getProducts();
      categoriesFuture = getCategories();
    });
  }

  _scrollListener() async {
    _scrollPosition = _scrollController.position.pixels;
    _scrollTop = _scrollController.position.maxScrollExtent;

    if (_scrollPosition >= _scrollTop - 600 &&
        isLoading == false &&
        hasPagination == true) {
      if (page + 1 <=
          Provider.of<HomeProvider>(context, listen: false).lastPage) {
        page = page + 1;
        setState(() {
          productFuture =
              Provider.of<HomeProvider>(context, listen: false).getProducts();
        });
      }
    }
  }

  Future<List> getCategories() async {
    isLoading = true;
    final response = await httpUtil.httpGet("/categories");

    //ALL products
    categories.add(CategoryModel.Category(
        id: 0,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        deletedAt: null,
        name: "All products",
        picture:
            "https://cdn-icons-png.flaticon.com/512/762/762159.png?w=826&t=st=1681988717~exp=1681989317~hmac=0b146f53b3022e85fcb630f38d6524f0e96a5146f8aeac4ed8ba382fb3c5b873",
        slug: "all"));

    for (Map<String, dynamic> data in response["data"]["data"]) {
      categories.add(CategoryModel.Category(
          id: data["ID"],
          createdAt: data["CreatedAt"],
          updatedAt: data["UpdatedAt"],
          deletedAt: data["DeletedAt"],
          name: data["name"],
          picture: data["picture"],
          slug: data["slug"]));
    }

    isLoading = false;

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Icon(Icons.menu, color: Colors.black87),
            actions: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("resources/images/profile.jpg"),
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
          backgroundColor: Colors.grey.shade50,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            elevation: 0,
            currentIndex: 0,
            selectedItemColor: Colors.green.shade200,
            unselectedItemColor: Colors.grey.shade400,
            showSelectedLabels: false,
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.home)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.list)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.shopping_bag)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.settings)),
                label: '',
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi Mr Terrance,"),
                    Text("Welcome Back!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    SearchBoxWidget(),
                    SubtitlesWidget(text: "Food categories"),
                    FutureBuilder(
                        future: categoriesFuture,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasError) {
                            if (!snapshot.hasData) {
                              return Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CategoryCardSkeleton(),
                                    CategoryCardSkeleton(),
                                  ],
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: 60,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CategoryCard(
                                          name: snapshot.data[index].name,
                                          picture: snapshot.data[index].picture,
                                          id: snapshot.data[index].id,
                                          isSelected: context
                                                  .watch<HomeProvider>()
                                                  .selectedCategory ==
                                              snapshot.data[index].id);
                                    }),
                              );
                            }
                          } else {
                            return Text(snapshot.error.toString());
                          }
                        }),
                    SubtitlesWidget(text: "Popular"),
                    FutureBuilder(
                        future: productFuture,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasError) {
                            if (!snapshot.hasData) {
                              return ProductGridSkeleton();
                            } else {
                              return GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 0.92,
                                          mainAxisSpacing: 10),
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HomeProductCard(
                                      name: snapshot.data[index].name,
                                      picture: snapshot.data[index].picture,
                                      price: snapshot.data[index].price,
                                    );
                                  });
                            }
                          } else {
                            return Text(snapshot.stackTrace.toString());
                          }
                        }),
                    isLoading ? ProductGridSkeleton() : SizedBox(height: 10),
                    SizedBox(height: 50)
                  ]),
            ),
          )),
    );
  }
}
