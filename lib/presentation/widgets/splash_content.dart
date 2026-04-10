import 'package:air_high_quality_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Icon(Icons.air_rounded, size: 88, color: AppColors.good),
        SizedBox(height: 16),
        Text(
          'AirGuard',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Live Air Monitoring',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            letterSpacing: 2,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: 48),
          child: CircularProgressIndicator(
            color: AppColors.good,
            strokeWidth: 2,
          ),
        ),
      ],
    );
  }
}
