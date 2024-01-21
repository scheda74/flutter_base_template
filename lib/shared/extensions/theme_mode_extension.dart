import 'package:flutter/material.dart';
import 'package:flutter_base_template/shared/extensions/context_extensions.dart';

extension ThemeModeIcon on ThemeMode {
  Icon getIcon() {
    switch (this) {
      case ThemeMode.system:
        return const Icon(Icons.wb_sunny_outlined);
      case ThemeMode.dark:
        return const Icon(Icons.dark_mode_rounded);
      case ThemeMode.light:
        return const Icon(Icons.wb_sunny_rounded);
      default:
        return const Icon(Icons.sunny);
    }
  }
}

extension ThemeModeName on ThemeMode {
  String getLocalizedName(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return context.localizations.system;
      case ThemeMode.dark:
        return context.localizations.dark;
      case ThemeMode.light:
        return context.localizations.light;
      default:
        return context.localizations.system;
    }
  }
}
