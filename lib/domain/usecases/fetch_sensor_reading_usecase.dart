import 'package:fpdart/fpdart.dart';

import '../entities/sensor_reading.dart';
import '../failures/failure.dart';
import '../repositories/sensor_repository.dart';

final class FetchSensorReadingUseCase {
  const FetchSensorReadingUseCase(this._repository);

  final SensorRepository _repository;

  Future<Either<Failure, SensorReading>> call() =>
      _repository.fetchLatestReading();
}
