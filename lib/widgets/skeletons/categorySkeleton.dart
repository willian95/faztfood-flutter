import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CategoryCardSkeleton extends StatelessWidget {
  CategoryCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SkeletonLine(
      style: SkeletonLineStyle(height: 60, width: 120),
    );
  }
}
