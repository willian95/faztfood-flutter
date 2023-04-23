import 'package:fastfoodapp/providers/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0)),
              ),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'Search Here',
                  ),
                  onFieldSubmitted: (value) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .setSearch(value);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
