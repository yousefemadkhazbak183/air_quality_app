import '../../core/utils/air_quality_calculator.dart';
import '../../domain/entities/sensor_reading.dart';

final class SensorReadingModel extends SensorReading {
  const SensorReadingModel({
    required super.temperature,
    required super.humidity,
    required super.airQualityStatus,
    required super.timestamp,
    required super.methane,
    required super.propane,
    required super.butane,
    required super.smoke,
    required super.alcohol,
  });

  factory SensorReadingModel.fromJson(Map<String, dynamic> json) {
    final gasLevel = (json['gas_level'] as num).toDouble();

    return SensorReadingModel(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      airQualityStatus: AirQualityCalculator.fromGasPpm(gasLevel),
      timestamp: DateTime.parse(json['created_at'] as String),
      methane: (json['methane'] as num).toDouble(),
      propane: (json['propane'] as num).toDouble(),
      butane: (json['butane'] as num).toDouble(),
      smoke: (json['smoke'] as num).toDouble(),
      alcohol: (json['alcohol'] as num).toDouble(),
    );
  }
  Map<String, dynamic> toJson() => {
    'temperature': temperature,
    'humidity': humidity,
    'methane': methane,
    'propane': propane,
    'butane': butane,
    'smoke': smoke,
    'alcohol': alcohol,
  };
}
