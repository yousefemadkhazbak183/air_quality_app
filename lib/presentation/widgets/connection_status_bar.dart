import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ConnectionStatusBar extends StatelessWidget {
  const ConnectionStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.circle, color: AppColors.good, size: 8),
          SizedBox(width: 8),
          Icon(Icons.wifi_rounded, color: AppColors.textSecondary, size: 16),
          SizedBox(width: 8),
          Text(
            'Connected to MQTT Broker',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
