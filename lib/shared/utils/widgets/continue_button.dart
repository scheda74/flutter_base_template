import 'package:flutter/material.dart';
import 'package:flutter_base_template/shared/extensions/context_extensions.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      icon: const Icon(Icons.arrow_forward),
      label: Text(context.localizations.continueLabel),
      onPressed: onPressed,
    );
  }
}
