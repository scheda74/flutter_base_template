import 'package:flutter/material.dart';
import 'package:flutter_base_template/localization/generated/app_localizations.dart';

extension UIThemeExtension on BuildContext {
  // * (default) TextTheme
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  // * Colors
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get secondaryContainerColor =>
      Theme.of(this).colorScheme.secondaryContainer;

  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get surfaceVariantColor => Theme.of(this).colorScheme.surfaceVariant;

  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get errorContainerColor => Theme.of(this).colorScheme.errorContainer;

  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
  Color get tertiaryContainerColor =>
      Theme.of(this).colorScheme.tertiaryContainer;
}

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
