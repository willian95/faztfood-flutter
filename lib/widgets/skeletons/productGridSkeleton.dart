import 'package:fastfoodapp/widgets/skeletons/productSkeleton.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ProductGridSkeleton extends StatelessWidget {
  ProductGridSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.92,
          mainAxisSpacing: 10),
      children: [
        ProductCardSkeleton(),
        ProductCardSkeleton(),
        ProductCardSkeleton(),
        ProductCardSkeleton(),
        ProductCardSkeleton(),
        ProductCardSkeleton(),
        ProductCardSkeleton(),
        ProductCardSkeleton(),
      ],
    );
  }
}
