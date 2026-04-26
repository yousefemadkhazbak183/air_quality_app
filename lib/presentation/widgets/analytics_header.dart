import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AnalyticsHeader extends StatelessWidget {
  const AnalyticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Analytics',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Historical Data',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
      ],
    );
  }
}
