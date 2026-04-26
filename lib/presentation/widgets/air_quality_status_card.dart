import 'package:flutter/material.dart';

import '../../core/enums/air_quality_status.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/air_quality_calculator.dart';
import '../../domain/entities/sensor_reading.dart';

class AirQualityStatusCard extends StatelessWidget {
  const AirQualityStatusCard({super.key, required this.reading});

  final SensorReading reading;

  Color get _statusColor => switch (reading.airQualityStatus) {
    AirQualityStatus.good => AppColors.good,
    AirQualityStatus.moderate => AppColors.moderate,
    AirQualityStatus.dangerous => AppColors.dangerous,
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _statusColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Air Quality Status',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _statusColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.shield_outlined,
                  color: _statusColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      reading.airQualityStatus.label,
                      key: ValueKey(reading.airQualityStatus),
                      style: TextStyle(
                        color: _statusColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    reading.airQualityStatus.description,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: AirQualityCalculator.toProgressValue(
                reading.dominantGasLevel,
              ),
              backgroundColor: AppColors.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(_statusColor),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Good',
                style: TextStyle(color: AppColors.textHint, fontSize: 11),
              ),
              Text(
                'Moderate',
                style: TextStyle(color: AppColors.textHint, fontSize: 11),
              ),
              Text(
                'Dangerous',
                style: TextStyle(color: AppColors.textHint, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
