import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultPadding extends StatelessWidget {
  final bool hasExtraPaddingTop;
  final Widget child;
  const DefaultPadding({
    super.key,
    required this.child,
    this.hasExtraPaddingTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPaddingX,
        right: defaultPaddingX,
        top: hasExtraPaddingTop ? 32.0 : 8.0,
        bottom: 8.0,
      ),
      child: child,
    );
  }
}
