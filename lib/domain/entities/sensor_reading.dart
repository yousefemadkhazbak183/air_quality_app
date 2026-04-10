import 'package:equatable/equatable.dart';

import '../../core/enums/air_quality_status.dart';

class SensorReading extends Equatable {
  const SensorReading({
    required this.gasLevel,
    required this.temperature,
    required this.humidity,
    required this.airQualityStatus,
    required this.timestamp,
  });

  final double gasLevel;
  final double temperature;
  final double humidity;
  final AirQualityStatus airQualityStatus;
  final DateTime timestamp;

  @override
  List<Object?> get props => [
    gasLevel,
    temperature,
    humidity,
    airQualityStatus,
    timestamp,
  ];
}
