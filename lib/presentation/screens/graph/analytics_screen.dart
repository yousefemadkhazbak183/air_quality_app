import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:air_high_quality_app/presentation/bloc/sensor_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/sensor_reading.dart';
import '../../widgets/analytics_header.dart';
import '../../widgets/chart_card.dart';
import '../../widgets/sensor_line_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SensorDataCubit, SensorDataState>(
          builder: (context, state) {
            final history = switch (state) {
              SensorDataUpdated(history: final h) => h,
              _ => <SensorReading>[],
            };

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AnalyticsHeader(),
                  const SizedBox(height: 20),
                  ChartCard(
                    title: 'Methane',
                    subtitle: 'CH4 concentration over time',
                    icon: Icons.local_fire_department_outlined,
                    iconColor: AppColors.good,
                    chart: SensorLineChart(
                      readings: history,
                      lineColor: AppColors.good,
                      valueSelector: (r) => r.methane,
                      unitLabel: 'ppm',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChartCard(
                    title: 'Propane',
                    subtitle: 'C3H8 concentration over time',
                    icon: Icons.local_fire_department_outlined,
                    iconColor: Colors.orange,
                    chart: SensorLineChart(
                      readings: history,
                      lineColor: Colors.orange,
                      valueSelector: (r) => r.propane,
                      unitLabel: 'ppm',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChartCard(
                    title: 'Butane',
                    subtitle: 'C4H10 concentration over time',
                    icon: Icons.science_outlined,
                    iconColor: Colors.purple,
                    chart: SensorLineChart(
                      readings: history,
                      lineColor: Colors.purple,
                      valueSelector: (r) => r.butane,
                      unitLabel: 'ppm',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChartCard(
                    title: 'Smoke',
                    subtitle: 'Smoke particles over time',
                    icon: Icons.cloud_outlined,
                    iconColor: AppColors.textSecondary,
                    chart: SensorLineChart(
                      readings: history,
                      lineColor: AppColors.textSecondary,
                      valueSelector: (r) => r.smoke,
                      unitLabel: 'ppm',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChartCard(
                    title: 'Alcohol',
                    subtitle: 'Ethanol concentration over time',
                    icon: Icons.water_drop_outlined,
                    iconColor: Colors.lightBlue,
                    chart: SensorLineChart(
                      readings: history,
                      lineColor: Colors.lightBlue,
                      valueSelector: (r) => r.alcohol,
                      unitLabel: 'ppm',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChartCard(
                    title: 'Temperature',
                    subtitle: 'Room temperature over time',
                    icon: Icons.thermostat_outlined,
                    iconColor: AppColors.moderate,
                    chart: SensorLineChart(
                      readings: history,
                      lineColor: AppColors.moderate,
                      valueSelector: (r) => r.temperature,
                      unitLabel: '°C',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChartCard(
                    title: 'Humidity',
                    subtitle: 'Air humidity level over time',
                    icon: Icons.water_drop_outlined,
                    iconColor: AppColors.moderate,
                    chart: SensorLineChart(
                      readings: history,
                      lineColor: AppColors.moderate,
                      valueSelector: (r) => r.humidity,
                      unitLabel: '%',
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
