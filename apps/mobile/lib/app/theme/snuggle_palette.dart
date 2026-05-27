import 'package:flutter/material.dart';

@immutable
class SnugglePalette {
  const SnugglePalette({
    required this.id,
    required this.label,
    required this.isDark,
    required this.background,
    required this.surface,
    required this.surfaceAlt,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.text,
    required this.mutedText,
    required this.border,
    required this.success,
    required this.warning,
    required this.danger,
    required this.heroGradientStart,
    required this.heroGradientEnd,
  });

  final String id;
  final String label;
  final bool isDark;
  final Color background;
  final Color surface;
  final Color surfaceAlt;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color text;
  final Color mutedText;
  final Color border;
  final Color success;
  final Color warning;
  final Color danger;
  final Color heroGradientStart;
  final Color heroGradientEnd;
}
