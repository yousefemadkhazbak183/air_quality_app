import 'package:air_high_quality_app/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: AppColors.good),
          const SizedBox(height: 16),
          Text(
            'Connecting to sensor...',
            style: TextStyle(color: context.textSecondaryColor),
          ),
        ],
      ),
    );
  }
}
