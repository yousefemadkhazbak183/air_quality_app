import 'dart:collection';

import 'package:fpdart/fpdart.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/sensor_reading.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/sensor_repository.dart';
import '../datasources/sensor_remote_datasource.dart';

final class SensorRepositoryImpl implements SensorRepository {
  SensorRepositoryImpl(this._datasource);

  final SensorRemoteDatasource _datasource;
  final Queue<SensorReading> _history = Queue();

  @override
  Future<Either<Failure, SensorReading>> fetchLatestReading() async {
    final result = await _datasource.fetchLatestReading();
    return result.map(_bufferAndReturn);
  }

  @override
  List<SensorReading> get historicalReadings => List.unmodifiable(_history);

  SensorReading _bufferAndReturn(SensorReading reading) {
    if (_history.length >= AppConstants.maxHistoricalReadings) {
      _history.removeFirst();
    }
    _history.addLast(reading);
    return reading;
  }
}
