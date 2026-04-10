import 'package:air_high_quality_app/domain/entities/sensor_reading.dart';
import 'package:air_high_quality_app/domain/repositories/sensor_repository.dart';

final class GetHistoricalReadingsUsecase {
  final SensorRepository _sensorRepository;

  GetHistoricalReadingsUsecase(this._sensorRepository);
  List<SensorReading> call() => _sensorRepository.historicalReadings;
}
