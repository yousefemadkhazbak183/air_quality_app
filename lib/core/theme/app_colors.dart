import 'package:flutter/material.dart';

abstract final class AppColors {
  // ============ DARK THEME ============
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF141414);
  static const Color surfaceVariant = Color(0xFF1A1A1A);
  static const Color cardBorder = Color(0xFF1F1F1F);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF4B5563);
  static const Color divider = Color(0xFF1F2937);
  static const Color cardShadow = Color(0x40000000);

  // ============ LIGHT THEME ============
  static const Color lightBackground = Color(0xFFF5F7FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFEEF2F6);
  static const Color lightCardBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightTextHint = Color(0xFF94A3B8);
  static const Color lightDivider = Color(0xFFE2E8F0);
  static const Color lightCardShadow = Color(0x14000000);

  // ============ SHARED (same in both) ============
  static const Color good = Color(0xFF00C17C);
  static const Color moderate = Color(0xFFF59E0B);
  static const Color dangerous = Color(0xFFEF4444);
  static const Color online = Color(0xFF00C17C);
}
