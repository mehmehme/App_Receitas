import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a4b),
      surfaceTint: Color(0xff904a4b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad9),
      onPrimaryContainer: Color(0xff3b080d),
      secondary: Color(0xff775656),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad9),
      onSecondaryContainer: Color(0xff2c1515),
      tertiary: Color(0xff755a2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdeae),
      onTertiaryContainer: Color(0xff281900),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff221919),
      onSurfaceVariant: Color(0xff524343),
      outline: Color(0xff857372),
      outlineVariant: Color(0xffd7c1c1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb3b2),
      primaryFixed: Color(0xffffdad9),
      onPrimaryFixed: Color(0xff3b080d),
      primaryFixedDim: Color(0xffffb3b2),
      onPrimaryFixedVariant: Color(0xff733335),
      secondaryFixed: Color(0xffffdad9),
      onSecondaryFixed: Color(0xff2c1515),
      secondaryFixedDim: Color(0xffe6bdbc),
      onSecondaryFixedVariant: Color(0xff5d3f3f),
      tertiaryFixed: Color(0xffffdeae),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffe4c18d),
      onTertiaryFixedVariant: Color(0xff5b431a),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae9),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dede),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6e2f31),
      surfaceTint: Color(0xff904a4b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffaa5f60),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff583b3b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8f6c6b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff563f16),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8d7043),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff221919),
      onSurfaceVariant: Color(0xff4e3f3f),
      outline: Color(0xff6c5b5b),
      outlineVariant: Color(0xff897676),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb3b2),
      primaryFixed: Color(0xffaa5f60),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff8d4749),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8f6c6b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff745453),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8d7043),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff72582d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae9),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dede),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff440f13),
      surfaceTint: Color(0xff904a4b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6e2f31),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff341b1c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff583b3b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff311f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff563f16),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2e2121),
      outline: Color(0xff4e3f3f),
      outlineVariant: Color(0xff4e3f3f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffe6e5),
      primaryFixed: Color(0xff6e2f31),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff52191d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff583b3b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff402626),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff563f16),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3d2902),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae9),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dede),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3b2),
      surfaceTint: Color(0xffffb3b2),
      onPrimary: Color(0xff561d20),
      primaryContainer: Color(0xff733335),
      onPrimaryContainer: Color(0xffffdad9),
      secondary: Color(0xffe6bdbc),
      onSecondary: Color(0xff442929),
      secondaryContainer: Color(0xff5d3f3f),
      onSecondaryContainer: Color(0xffffdad9),
      tertiary: Color(0xffe4c18d),
      onTertiary: Color(0xff422c05),
      tertiaryContainer: Color(0xff5b431a),
      onTertiaryContainer: Color(0xffffdeae),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfff0dede),
      onSurfaceVariant: Color(0xffd7c1c1),
      outline: Color(0xffa08c8c),
      outlineVariant: Color(0xff524343),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dede),
      inversePrimary: Color(0xff904a4b),
      primaryFixed: Color(0xffffdad9),
      onPrimaryFixed: Color(0xff3b080d),
      primaryFixedDim: Color(0xffffb3b2),
      onPrimaryFixedVariant: Color(0xff733335),
      secondaryFixed: Color(0xffffdad9),
      onSecondaryFixed: Color(0xff2c1515),
      secondaryFixedDim: Color(0xffe6bdbc),
      onSecondaryFixedVariant: Color(0xff5d3f3f),
      tertiaryFixed: Color(0xffffdeae),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffe4c18d),
      onTertiaryFixedVariant: Color(0xff5b431a),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff221919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb9b8),
      surfaceTint: Color(0xffffb3b2),
      onPrimary: Color(0xff340408),
      primaryContainer: Color(0xffcb7a7b),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffebc1c0),
      onSecondary: Color(0xff261010),
      secondaryContainer: Color(0xffad8887),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe9c591),
      onTertiary: Color(0xff211400),
      tertiaryContainer: Color(0xffab8c5c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfffff9f9),
      onSurfaceVariant: Color(0xffdcc6c5),
      outline: Color(0xffb29e9d),
      outlineVariant: Color(0xff917f7e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dede),
      inversePrimary: Color(0xff743436),
      primaryFixed: Color(0xffffdad9),
      onPrimaryFixed: Color(0xff2c0105),
      primaryFixedDim: Color(0xffffb3b2),
      onPrimaryFixedVariant: Color(0xff5e2325),
      secondaryFixed: Color(0xffffdad9),
      onSecondaryFixed: Color(0xff200b0b),
      secondaryFixedDim: Color(0xffe6bdbc),
      onSecondaryFixedVariant: Color(0xff4a2f2f),
      tertiaryFixed: Color(0xffffdeae),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffe4c18d),
      onTertiaryFixedVariant: Color(0xff48320a),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff221919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb3b2),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb9b8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffebc1c0),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe9c591),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffdcc6c5),
      outlineVariant: Color(0xffdcc6c5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dede),
      inversePrimary: Color(0xff4e171a),
      primaryFixed: Color(0xffffe0df),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb9b8),
      onPrimaryFixedVariant: Color(0xff340408),
      secondaryFixed: Color(0xffffe0df),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffebc1c0),
      onSecondaryFixedVariant: Color(0xff261010),
      tertiaryFixed: Color(0xffffe3bc),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe9c591),
      onTertiaryFixedVariant: Color(0xff211400),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff221919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
