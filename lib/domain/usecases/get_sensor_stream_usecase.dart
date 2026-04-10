import '../entities/sensor_reading.dart';
import '../repositories/sensor_repository.dart';

final class GetSensorStreamUseCase {
  const GetSensorStreamUseCase(this._repository);

  final SensorRepository _repository;

  Stream<SensorReading> call() => _repository.sensorStream;
}
