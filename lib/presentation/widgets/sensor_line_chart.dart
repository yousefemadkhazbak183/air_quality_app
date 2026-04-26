import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../domain/entities/sensor_reading.dart';

class SensorLineChart extends StatelessWidget {
  const SensorLineChart({
    super.key,
    required this.readings,
    required this.lineColor,
    required this.valueSelector,
    required this.unitLabel,
  });

  final List<SensorReading> readings;
  final Color lineColor;
  final double Function(SensorReading) valueSelector;
  final String unitLabel;

  @override
  Widget build(BuildContext context) {
    if (readings.isEmpty) {
      return const Center(
        child: Text(
          'No data yet...',
          style: TextStyle(color: AppColors.textHint),
        ),
      );
    }

    final spots = readings.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), valueSelector(e.value));
    }).toList();

    return LineChart(
      LineChartData(
        backgroundColor: AppColors.surface,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) =>
              const FlLine(color: AppColors.surfaceVariant, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                '${value.toInt()}',
                style: const TextStyle(color: AppColors.textHint, fontSize: 10),
              ),
            ),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => AppColors.surfaceVariant,
            getTooltipItems: (spots) => spots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(1)}$unitLabel',
                TextStyle(
                  color: lineColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              );
            }).toList(),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: lineColor,
            barWidth: 2,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: lineColor.withValues(alpha: 0.08),
            ),
          ),
        ],
      ),
    );
  }
}
