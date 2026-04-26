import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ThresholdTile extends StatelessWidget {
  const ThresholdTile({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.unit,
  });

  final String label;
  final double value;
  final Color color;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
              ),
            ),
            Text(
              '${value.toInt()} $unit',
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value / 1000,
            backgroundColor: AppColors.surfaceVariant,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}
