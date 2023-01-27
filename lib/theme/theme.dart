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
      scaffoldBackgroundColor: lightColorScheme.secondaryContainer,
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
      scaffoldBackgroundColor: lightColorScheme.secondaryContainer,
      // snackBarTheme: const SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      // ),
      // toggleableActiveColor: const Color(0xFF13B9FF),
    );
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF934B00),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDCC5),
  onPrimaryContainer: Color(0xFF301400),
  secondary: Color(0xFF755945),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDCC5),
  onSecondaryContainer: Color(0xFF2A1708),
  tertiary: Color(0xFF5E6135),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFE4E6AF),
  onTertiaryContainer: Color(0xFF1B1D00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF201A17),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF201A17),
  surfaceVariant: Color(0xFFF3DFD2),
  onSurfaceVariant: Color(0xFF52443B),
  outline: Color(0xFF84746A),
  onInverseSurface: Color(0xFFFBEEE8),
  inverseSurface: Color(0xFF362F2B),
  inversePrimary: Color(0xFFFFB782),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF934B00),
  outlineVariant: Color(0xFFD6C3B7),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB782),
  onPrimary: Color(0xFF4F2500),
  primaryContainer: Color(0xFF703800),
  onPrimaryContainer: Color(0xFFFFDCC5),
  secondary: Color(0xFFE4BFA7),
  onSecondary: Color(0xFF422B1B),
  secondaryContainer: Color(0xFF5B412F),
  onSecondaryContainer: Color(0xFFFFDCC5),
  tertiary: Color(0xFFC7CA95),
  onTertiary: Color(0xFF30330B),
  tertiaryContainer: Color(0xFF464920),
  onTertiaryContainer: Color(0xFFE4E6AF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF201A17),
  onBackground: Color(0xFFECE0DA),
  surface: Color(0xFF201A17),
  onSurface: Color(0xFFECE0DA),
  surfaceVariant: Color(0xFF52443B),
  onSurfaceVariant: Color(0xFFD6C3B7),
  outline: Color(0xFF9F8D83),
  onInverseSurface: Color(0xFF201A17),
  inverseSurface: Color(0xFFECE0DA),
  inversePrimary: Color(0xFF934B00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB782),
  outlineVariant: Color(0xFF52443B),
  scrim: Color(0xFF000000),
);




