import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.good),
          SizedBox(height: 16),
          Text(
            'Connecting to sensor...',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
