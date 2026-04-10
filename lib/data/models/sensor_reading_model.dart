import '../../core/utils/air_quality_calculator.dart';
import '../../domain/entities/sensor_reading.dart';

final class SensorReadingModel extends SensorReading {
  const SensorReadingModel({
    required super.gasLevel,
    required super.temperature,
    required super.humidity,
    required super.airQualityStatus,
    required super.timestamp,
  });

  factory SensorReadingModel.fromJson(Map<String, dynamic> json) {
    final gasLevel = (json['gas_level'] as num).toDouble();

    return SensorReadingModel(
      gasLevel: gasLevel,
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      airQualityStatus: AirQualityCalculator.fromGasPpm(gasLevel),
      timestamp: DateTime.parse(json['created_at'] as String),
    );
  }
}
