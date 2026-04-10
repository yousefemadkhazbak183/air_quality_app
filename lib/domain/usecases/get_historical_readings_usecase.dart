import '../entities/sensor_reading.dart';
import '../repositories/sensor_repository.dart';

final class GetHistoricalReadingsUseCase {
  const GetHistoricalReadingsUseCase(this._repository);

  final SensorRepository _repository;

  List<SensorReading> call() => _repository.historicalReadings;
}
