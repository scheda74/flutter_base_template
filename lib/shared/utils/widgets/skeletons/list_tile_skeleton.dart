import 'package:flutter/material.dart';

import 'image_container_skeleton.dart';
import 'text_skeleton.dart';

class ListTileSkeleton extends StatelessWidget {
  final bool hasLeading;
  final bool hasSubtitle;

  const ListTileSkeleton({
    super.key,
    this.hasLeading = true,
    this.hasSubtitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const TextSkeleton(
        height: 12,
      ),
      subtitle: hasSubtitle
          ? const TextSkeleton(
              widthFactor: 0.5,
            )
          : null,
      leading: hasLeading
          ? const ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              child: ImageContainerSkeleton(),
            )
          : null,
    );
  }
}
