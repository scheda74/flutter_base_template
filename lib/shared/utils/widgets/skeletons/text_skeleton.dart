import 'package:flutter/material.dart';

import 'skeleton.dart';

class TextSkeleton extends StatelessWidget {
  final double widthFactor;
  final double height;

  const TextSkeleton({
    super.key,
    this.widthFactor = 0.9,
    this.height = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      widthFactor: widthFactor,
      height: height,
    );
  }
}
