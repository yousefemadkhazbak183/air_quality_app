import 'package:flutter/material.dart';

import '../../core/enums/air_quality_status.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/entities/sensor_reading.dart';
import 'air_quality_status_card.dart';
import 'connection_status_bar.dart';
import 'dashboard_header.dart';
import 'sensor_card.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key, required this.reading});

  final SensorReading reading;

  Color _gasColor(AirQualityStatus status) => switch (status) {
    AirQualityStatus.good => AppColors.good,
    AirQualityStatus.moderate => AppColors.moderate,
    AirQualityStatus.dangerous => AppColors.dangerous,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardHeader(),
          const SizedBox(height: 20),
          AirQualityStatusCard(reading: reading),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: SensorCard(
                  title: 'Gas Level',
                  subtitle: 'Air gas concentration',
                  value: reading.dominantGasLevel.toStringAsFixed(0),
                  unit: 'ppm',
                  icon: Icons.local_fire_department_outlined,
                  accentColor: _gasColor(reading.airQualityStatus),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SensorCard(
                  title: 'Temperature',
                  subtitle: 'Room temperature',
                  value: reading.temperature.toStringAsFixed(1),
                  unit: '°C',
                  icon: Icons.thermostat_outlined,
                  accentColor: AppColors.moderate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SensorCard(
            title: 'Humidity',
            subtitle: 'Air humidity level',
            value: reading.humidity.toStringAsFixed(0),
            unit: '%',
            icon: Icons.water_drop_outlined,
            accentColor: AppColors.moderate,
            showProgress: true,
            progressValue: reading.humidity / 100,
          ),
          const SizedBox(height: 12),
          const ConnectionStatusBar(),
        ],
      ),
    );
  }
}
