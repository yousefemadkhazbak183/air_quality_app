import 'package:air_high_quality_app/domain/entities/sensor_reading.dart';
import 'package:air_high_quality_app/domain/failures/failure.dart';
import 'package:air_high_quality_app/domain/repositories/sensor_repository.dart';
import 'package:fpdart/fpdart.dart';

final class FetchSensorReadingUseCase {
  FetchSensorReadingUseCase(this._sensorRepository);

  final SensorRepository _sensorRepository;

  Future<Either<Failure, SensorReading>> call() =>
      _sensorRepository.fetchLatestReading();
}
