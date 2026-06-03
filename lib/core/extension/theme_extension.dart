import 'package:air_high_quality_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  // Backgrounds
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get surfaceVariantColor {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark
        ? AppColors.surfaceVariant
        : AppColors.lightSurfaceVariant;
  }

  Color get cardBorderColor {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark
        ? AppColors.cardBorder
        : AppColors.lightCardBorder;
  }

  // Text
  Color get textPrimaryColor => Theme.of(this).colorScheme.onSurface;
  Color get textSecondaryColor {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark
        ? AppColors.textSecondary
        : AppColors.lightTextSecondary;
  }

  Color get textHintColor {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark
        ? AppColors.textHint
        : AppColors.lightTextHint;
  }

  Color get dividerColor {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark
        ? AppColors.divider
        : AppColors.lightDivider;
  }

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
