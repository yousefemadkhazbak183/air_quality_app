import 'package:air_high_quality_app/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ConnectionStatusBar extends StatelessWidget {
  const ConnectionStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.cardBorderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.circle, color: AppColors.good, size: 8),
          const SizedBox(width: 8),
          Icon(Icons.wifi_rounded, color: context.textSecondaryColor, size: 16),
          const SizedBox(width: 8),
          Text(
            'Connected to MQTT Broker',
            style: TextStyle(color: context.textSecondaryColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
