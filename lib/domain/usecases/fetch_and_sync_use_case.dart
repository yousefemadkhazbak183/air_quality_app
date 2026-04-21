import 'package:fpdart/fpdart.dart';

import '../entities/sensor_reading.dart';
import '../failures/failure.dart';
import '../repositories/sensor_repository.dart';

final class FetchAndSyncUseCase {
  const FetchAndSyncUseCase(this._repository);

  final SensorRepository _repository;

  Future<Either<Failure, SensorReading>> call() => _repository.fetchAndSync();
}
