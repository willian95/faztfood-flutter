import 'dart:ffi';

class Category {
  int id = 0;
  String createdAt = "";
  String updatedAt = "";
  String? deletedAt = "";
  String name = "";
  String picture = "";
  String slug = "";

  Category(
      {id = 0,
      createdAt = "",
      updatedAt = "",
      deletedAt = "",
      name = "",
      picture = "",
      slug = ""}) {
    this.id = id;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.deletedAt = deletedAt;
    this.name = name;
    this.picture = picture;
    this.slug = slug;
  }
}
