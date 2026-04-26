import '../../core/utils/air_quality_calculator.dart';
import '../../domain/entities/sensor_reading.dart';

final class SensorReadingModel extends SensorReading {
  const SensorReadingModel({
    required super.temperature,
    required super.humidity,
    required super.methane,
    required super.propane,
    required super.butane,
    required super.smoke,
    required super.alcohol,
    required super.airQualityStatus,
    required super.timestamp,
  });

  factory SensorReadingModel.fromJson(Map<String, dynamic> json) {
    final methane = (json['methane'] as num?)?.toDouble() ?? 0.0;
    final propane = (json['propane'] as num?)?.toDouble() ?? 0.0;
    final butane = (json['butane'] as num?)?.toDouble() ?? 0.0;
    final smoke = (json['smoke'] as num?)?.toDouble() ?? 0.0;
    final alcohol = (json['alcohol'] as num?)?.toDouble() ?? 0.0;

    final dominantGas = [
      methane,
      propane,
      butane,
      smoke,
      alcohol,
    ].reduce((a, b) => a > b ? a : b);

    return SensorReadingModel(
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? 0.0,
      methane: methane,
      propane: propane,
      butane: butane,
      smoke: smoke,
      alcohol: alcohol,
      airQualityStatus: AirQualityCalculator.fromGasPpm(dominantGas),
      timestamp: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
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
