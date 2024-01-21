import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Displays a loading indicator on top of its child that blocks all gestures
/// while [isLoading] is true.
///
/// Displays nothing except its child if [isLoading] is false.
class BlockingLoading extends StatelessWidget {
  static const double blurSigma = 5.0;

  final bool isLoading;
  final Widget child;
  const BlockingLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: const Center(
                  child: CircularProgressIndicator(),
                )),
          ).animate().fadeIn(),
      ],
    );
  }
}
