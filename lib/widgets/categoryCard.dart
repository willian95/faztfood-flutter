import 'package:fastfoodapp/providers/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  String name;
  String picture;
  int id;
  bool isSelected;

  CategoryCard(
      {Key? key,
      required this.name,
      required this.picture,
      required this.id,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false)
            .setSelectedCategory(id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade300 : Colors.grey.shade200,
          border: Border.all(
            color: isSelected ? Colors.green.shade300 : Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(picture, height: 25, width: 25),
            SizedBox(width: 5),
            Text(
              name,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black38,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
