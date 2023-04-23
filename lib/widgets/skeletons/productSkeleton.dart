import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ProductCardSkeleton extends StatelessWidget {
  ProductCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SkeletonLine(
      style: SkeletonLineStyle(
          height: 300, borderRadius: BorderRadius.circular(10)),
    );
  }
}
