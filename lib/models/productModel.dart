import 'dart:ffi';

class Product {
  int id = 0;
  String createdAt = "";
  String updatedAt = "";
  String? deletedAt = "";
  String name = "";
  String picture = "";
  String description = "";
  String subtitle = "";
  double rating = 0.0;
  double price = 0.0;

  Product(
      {id = 0,
      createdAt = "",
      updatedAt = "",
      deletedAt = "",
      name = "",
      picture = "",
      description = "",
      subtitle = "",
      rating = 0.0,
      price = 0.0}) {
    this.id = id;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.deletedAt = deletedAt;
    this.name = name;
    this.picture = picture;
    this.description = description;
    this.subtitle = subtitle;
    this.rating = rating;
    this.price = price;
  }
}
