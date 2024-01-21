import 'package:flutter/material.dart';

import 'skeleton.dart';

class TextFieldSkeleton extends StatelessWidget {
  const TextFieldSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      widthFactor: 1,
      height: 64.0,
    );
  }
}
