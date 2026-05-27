import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_palette.dart';

@immutable
class SnuggleThemeTokens extends ThemeExtension<SnuggleThemeTokens> {
  const SnuggleThemeTokens({
    required this.surfaceAlt,
    required this.mutedText,
    required this.border,
    required this.accent,
    required this.heroGradientStart,
    required this.heroGradientEnd,
  });

  final Color surfaceAlt;
  final Color mutedText;
  final Color border;
  final Color accent;
  final Color heroGradientStart;
  final Color heroGradientEnd;

  @override
  SnuggleThemeTokens copyWith({
    Color? surfaceAlt,
    Color? mutedText,
    Color? border,
    Color? accent,
    Color? heroGradientStart,
    Color? heroGradientEnd,
  }) {
    return SnuggleThemeTokens(
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      mutedText: mutedText ?? this.mutedText,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      heroGradientStart: heroGradientStart ?? this.heroGradientStart,
      heroGradientEnd: heroGradientEnd ?? this.heroGradientEnd,
    );
  }

  @override
  ThemeExtension<SnuggleThemeTokens> lerp(
    covariant ThemeExtension<SnuggleThemeTokens>? other,
    double t,
  ) {
    if (other is! SnuggleThemeTokens) {
      return this;
    }

    return SnuggleThemeTokens(
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t) ?? surfaceAlt,
      mutedText: Color.lerp(mutedText, other.mutedText, t) ?? mutedText,
      border: Color.lerp(border, other.border, t) ?? border,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      heroGradientStart:
          Color.lerp(heroGradientStart, other.heroGradientStart, t) ??
          heroGradientStart,
      heroGradientEnd:
          Color.lerp(heroGradientEnd, other.heroGradientEnd, t) ??
          heroGradientEnd,
    );
  }
}

ThemeData buildSnuggleTheme(SnugglePalette palette) {
  final baseColorScheme = ColorScheme.fromSeed(
    seedColor: palette.primary,
    brightness: palette.isDark ? Brightness.dark : Brightness.light,
  );

  final colorScheme = baseColorScheme.copyWith(
    primary: palette.primary,
    secondary: palette.secondary,
    tertiary: palette.accent,
    surface: palette.surface,
    onSurface: palette.text,
    onSurfaceVariant: palette.mutedText,
    outline: palette.border,
    error: palette.danger,
  );

  final baseTheme = ThemeData(
    useMaterial3: true,
    brightness: palette.isDark ? Brightness.dark : Brightness.light,
  );

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: palette.background,
    dividerColor: palette.border,
    textTheme: baseTheme.textTheme.apply(
      bodyColor: palette.text,
      displayColor: palette.text,
      fontFamily: 'Avenir Next',
    ),
    cardTheme: CardThemeData(
      color: palette.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: palette.border),
      ),
    ),
    chipTheme: baseTheme.chipTheme.copyWith(
      side: BorderSide(color: palette.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: palette.surface,
      selectedColor: palette.surfaceAlt,
      labelStyle: TextStyle(color: palette.text, fontWeight: FontWeight.w600),
    ),
    extensions: <ThemeExtension<dynamic>>[
      SnuggleThemeTokens(
        surfaceAlt: palette.surfaceAlt,
        mutedText: palette.mutedText,
        border: palette.border,
        accent: palette.accent,
        heroGradientStart: palette.heroGradientStart,
        heroGradientEnd: palette.heroGradientEnd,
      ),
    ],
  );
}

SnuggleThemeTokens snuggleTokens(BuildContext context) {
  return Theme.of(context).extension<SnuggleThemeTokens>()!;
}
