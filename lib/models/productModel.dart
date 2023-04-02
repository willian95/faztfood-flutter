import 'dart:ffi';

class Product {
  int id = 0;
  String createdAt = "";
  String updatedAt = "";
  String deletedAt = "";
  String name = "";
  String picture = "";
  String description = "";
  String subtitle = "";
  double rating = 0.0;

  Product(
      {id = 0,
      createdAt = "",
      updatedAt = "",
      deletedAt = "",
      name = "",
      picture = "",
      description = "",
      subtitle = "",
      rating = 0.0});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["ID"],
      createdAt: json["CreatedAt"],
      updatedAt: json["UpdatedAt"],
      deletedAt: json["DeletedAt"],
      name: json["name"],
      description: json["description"],
      picture: json["picture"],
      subtitle: json["subtitle"],
      rating: json["rating"].toDouble());

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "name": name,
        "description": description,
        "picture": picture,
        "subtitle": subtitle,
        "rating": rating
      };
}
