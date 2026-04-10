import 'package:equatable/equatable.dart';

import '../../core/enums/air_quality_status.dart';

class SensorReading extends Equatable {
  const SensorReading({
    required this.temperature,
    required this.humidity,
    required this.methane,
    required this.propane,
    required this.butane,
    required this.smoke,
    required this.alcohol,
    required this.airQualityStatus,
    required this.timestamp,
  });

  final double temperature;
  final double humidity;
  final double methane;
  final double propane;
  final double butane;
  final double smoke;
  final double alcohol;
  final AirQualityStatus airQualityStatus;
  final DateTime timestamp;

  double get dominantGasLevel => [
    methane,
    propane,
    butane,
    smoke,
    alcohol,
  ].reduce((a, b) => a > b ? a : b);

  @override
  List<Object?> get props => [
    temperature,
    humidity,
    methane,
    propane,
    butane,
    smoke,
    alcohol,
    airQualityStatus,
    timestamp,
  ];
}
