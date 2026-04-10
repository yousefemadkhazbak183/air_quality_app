import 'package:flutter/material.dart';

abstract final class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF141414);
  static const Color surfaceVariant = Color(0xFF1A1A1A);
  static const Color cardBorder = Color(0xFF1F1F1F);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF4B5563);

  // Air quality status
  static const Color good = Color(0xFF00E5A0);
  static const Color moderate = Color(0xFFFFC107);
  static const Color dangerous = Color(0xFFF44336);

  // Misc
  static const Color cardShadow = Color(0x40000000);
  static const Color divider = Color(0xFF1F2937);
  static const Color online = Color(0xFF00E5A0);
}
