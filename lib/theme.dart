import 'package:flutter/material.dart';

/* Buttons */
const rectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(8.0),
  ),
);

final filledButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    shape: rectangleBorder,
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: rectangleBorder,
  ),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: rectangleBorder,
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(shape: rectangleBorder),
);

/* Color Scheme */
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFAB350B),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDBD1),
  onPrimaryContainer: Color(0xFF3A0A00),
  secondary: Color(0xFF77574D),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDBD1),
  onSecondaryContainer: Color(0xFF2C150F),
  tertiary: Color(0xFF6B5D2F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFF5E2A7),
  onTertiaryContainer: Color(0xFF231B00),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  outline: Color(0xFF85736E),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF201A18),
  surface: Color(0xFFFFF8F6),
  onSurface: Color(0xFF201A18),
  surfaceVariant: Color(0xFFF5DED7),
  onSurfaceVariant: Color(0xFF53433F),
  inverseSurface: Color(0xFF362F2D),
  onInverseSurface: Color(0xFFFBEEEA),
  inversePrimary: Color(0xFFFFB59F),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFAB350B),
  outlineVariant: Color(0xFFD8C2BC),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB59F),
  onPrimary: Color(0xFF5F1600),
  primaryContainer: Color(0xFF862300),
  onPrimaryContainer: Color(0xFFFFDBD1),
  secondary: Color(0xFFE7BDB1),
  onSecondary: Color(0xFF442A22),
  secondaryContainer: Color(0xFF5D4037),
  onSecondaryContainer: Color(0xFFFFDBD1),
  tertiary: Color(0xFFD8C68D),
  onTertiary: Color(0xFF3A2F05),
  tertiaryContainer: Color(0xFF524619),
  onTertiaryContainer: Color(0xFFF5E2A7),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  outline: Color(0xFFA08C87),
  background: Color(0xFF201A18),
  onBackground: Color(0xFFEDE0DC),
  surface: Color(0xFF181210),
  onSurface: Color(0xFFD0C4C1),
  surfaceVariant: Color(0xFF53433F),
  onSurfaceVariant: Color(0xFFD8C2BC),
  inverseSurface: Color(0xFFEDE0DC),
  onInverseSurface: Color(0xFF201A18),
  inversePrimary: Color(0xFFAB350B),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB59F),
  outlineVariant: Color(0xFF53433F),
  scrim: Color(0xFF000000),
);

/* Actual Themes */
ThemeData createTheme(ColorScheme colorScheme) {
  return ThemeData(
    useMaterial3: true,
    filledButtonTheme: filledButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    colorScheme: colorScheme,
  );
}
