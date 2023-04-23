import 'package:flutter/material.dart';

class HomeProductCard extends StatelessWidget {
  String name;
  String picture;
  double price;

  HomeProductCard(
      {Key? key,
      required this.name,
      required this.picture,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(name)),
          Center(
            child: Image.network(
              picture,
              fit: BoxFit.fill,
              height: 120,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 6, left: 10),
                  child: Text("\$ " + price.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Container(
                transform: Matrix4.translationValues(0, 8, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.green.shade200),
                    onPressed: () {},
                    child: Icon(Icons.add)),
              )
            ],
          )
        ],
      ),
    );
  }
}
