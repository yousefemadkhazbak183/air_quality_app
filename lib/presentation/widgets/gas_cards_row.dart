import 'package:flutter/material.dart';

import '../../core/enums/air_quality_status.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/air_quality_calculator.dart';
import '../../domain/entities/sensor_reading.dart';
import 'sensor_card.dart';

class GasCardsRow extends StatelessWidget {
  const GasCardsRow({super.key, required this.reading});

  final SensorReading reading;

  Color _gasColor(double ppm) {
    final status = AirQualityCalculator.fromGasPpm(ppm);
    return switch (status) {
      AirQualityStatus.good => AppColors.good,
      AirQualityStatus.moderate => AppColors.moderate,
      AirQualityStatus.dangerous => AppColors.dangerous,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SensorCard(
                title: 'Methane',
                subtitle: 'CH4',
                value: reading.methane.toStringAsFixed(1),
                unit: 'ppm',
                icon: Icons.local_fire_department_outlined,
                accentColor: _gasColor(reading.methane),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SensorCard(
                title: 'Propane',
                subtitle: 'C3H8',
                value: reading.propane.toStringAsFixed(1),
                unit: 'ppm',
                icon: Icons.local_fire_department_outlined,
                accentColor: _gasColor(reading.propane),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: SensorCard(
                title: 'Butane',
                subtitle: 'C4H10',
                value: reading.butane.toStringAsFixed(1),
                unit: 'ppm',
                icon: Icons.science_outlined,
                accentColor: _gasColor(reading.butane),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SensorCard(
                title: 'Smoke',
                subtitle: 'Particles',
                value: reading.smoke.toStringAsFixed(1),
                unit: 'ppm',
                icon: Icons.cloud_outlined,
                accentColor: _gasColor(reading.smoke),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SensorCard(
          title: 'Alcohol',
          subtitle: 'Ethanol',
          value: reading.alcohol.toStringAsFixed(1),
          unit: 'ppm',
          icon: Icons.water_drop_outlined,
          accentColor: _gasColor(reading.alcohol),
        ),
      ],
    );
  }
}
