import '../entities/sensor_reading.dart';
import '../repositories/sensor_repository.dart';

final class GetReadingsStreamUseCase {
  const GetReadingsStreamUseCase(this._repository);

  final SensorRepository _repository;

  Stream<List<SensorReading>> call() => _repository.readingsStream;
}
