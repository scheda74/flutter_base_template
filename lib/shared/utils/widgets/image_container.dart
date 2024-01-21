import 'package:flutter/material.dart';
import 'package:flutter_base_template/shared/extensions/context_extensions.dart';
import 'package:flutter_base_template/shared/utils/constants.dart';

class ImageContainer extends StatelessWidget {
  static const double imageSize = 45.0;

  final Widget? child;

  const ImageContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(defaultBorderRadius),
      ),
      child: Container(
        width: imageSize,
        height: imageSize,
        color: context.colorScheme.primaryContainer.withOpacity(0.3),
        child: Center(child: child),
      ),
    );
  }
}
