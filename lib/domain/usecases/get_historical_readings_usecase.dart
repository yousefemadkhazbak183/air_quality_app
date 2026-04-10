import 'package:air_high_quality_app/domain/entities/sensor_reading.dart';
import 'package:air_high_quality_app/domain/repositories/sensor_repository.dart';

final class GetHistoricalReadingsUseCase {
  final SensorRepository _sensorRepository;

  GetHistoricalReadingsUseCase(this._sensorRepository);
  List<SensorReading> call() => _sensorRepository.historicalReadings;
}
