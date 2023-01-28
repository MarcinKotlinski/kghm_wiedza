import 'package:flutter/material.dart';

class FlutterSmartKampusTheme {
  static ThemeData get light {
    return ThemeData(
      // appBarTheme: const AppBarTheme(
      //   color: Color(0xFF13B9FF),
      // ),
      useMaterial3: true,
      fontFamily: 'Roboto',
      colorScheme: lightColorScheme,
      // scaffoldBackgroundColor: lightColorScheme.onTertiary,
      // snackBarTheme: const SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      // ),
      // toggleableActiveColor: const Color(0xFF13B9FF),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      // appBarTheme: const AppBarTheme(
      //   color: Color(0xFF13B9FF),
      // ),
      useMaterial3: true,
      fontFamily: 'Roboto',
      colorScheme: darkColorScheme,
      // scaffoldBackgroundColor: lightColorScheme.onTertiary,
      // snackBarTheme: const SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      // ),
      // toggleableActiveColor: const Color(0xFF13B9FF),
    );
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF974812),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDBCA),
  onPrimaryContainer: Color(0xFF331200),
  secondary: Color(0xFF765848),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDBCA),
  onSecondaryContainer: Color(0xFF2B160A),
  tertiary: Color(0xFF636032),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFEAE5AB),
  onTertiaryContainer: Color(0xFF1E1C00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF201A17),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF201A17),
  surfaceVariant: Color(0xFFF4DED4),
  onSurfaceVariant: Color(0xFF52443D),
  outline: Color(0xFF85746B),
  onInverseSurface: Color(0xFFFBEEE9),
  inverseSurface: Color(0xFF362F2C),
  inversePrimary: Color(0xFFFFB68F),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF974812),
  outlineVariant: Color(0xFFD7C2B9),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB68F),
  onPrimary: Color(0xFF542100),
  primaryContainer: Color(0xFF773200),
  onPrimaryContainer: Color(0xFFFFDBCA),
  secondary: Color(0xFFE6BEAB),
  onSecondary: Color(0xFF432B1D),
  secondaryContainer: Color(0xFF5C4132),
  onSecondaryContainer: Color(0xFFFFDBCA),
  tertiary: Color(0xFFCEC891),
  onTertiary: Color(0xFF343108),
  tertiaryContainer: Color(0xFF4B481D),
  onTertiaryContainer: Color(0xFFEAE5AB),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF201A17),
  onBackground: Color(0xFFECE0DB),
  surface: Color(0xFF201A17),
  onSurface: Color(0xFFECE0DB),
  surfaceVariant: Color(0xFF52443D),
  onSurfaceVariant: Color(0xFFD7C2B9),
  outline: Color(0xFF9F8D84),
  onInverseSurface: Color(0xFF201A17),
  inverseSurface: Color(0xFFECE0DB),
  inversePrimary: Color(0xFF974812),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB68F),
  outlineVariant: Color(0xFF52443D),
  scrim: Color(0xFF000000),
);




