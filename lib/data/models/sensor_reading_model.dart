import 'package:air_high_quality_app/core/utils/air_quality_calculator.dart';
import 'package:air_high_quality_app/domain/entities/sensor_reading.dart';

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
    final methane = (json['methane'] as num).toDouble();
    final propane = (json['propane'] as num).toDouble();
    final butane = (json['butane'] as num).toDouble();
    final smoke = (json['smoke'] as num).toDouble();
    final alcohol = (json['alcohol'] as num).toDouble();

    final domainGas = [
      methane,
      propane,
      butane,
      smoke,
      alcohol,
    ].reduce((a, b) => a > b ? a : b);

    return SensorReadingModel(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      methane: methane,
      propane: propane,
      butane: butane,
      smoke: smoke,
      alcohol: alcohol,
      airQualityStatus: AirQualityCalculator.fromGasPpm(domainGas),
      timestamp: DateTime.now(),
    );
  }
}
