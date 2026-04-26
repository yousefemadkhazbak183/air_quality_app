import 'package:air_high_quality_app/core/theme/app_colors.dart';
import 'package:air_high_quality_app/domain/entities/sensor_reading.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key, required this.reading});

  final SensorReading reading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.good.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.air_rounded,
                    color: AppColors.good,
                    size: 20,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      'AirGuard',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Live Air Monitoring',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.good,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.wifi_rounded,
                  color: AppColors.textSecondary,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
