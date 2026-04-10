import 'dart:collection';

import 'package:air_high_quality_app/core/constants/app_constants.dart';
import 'package:air_high_quality_app/data/datasources/sensor_remote_datasource.dart';
import 'package:air_high_quality_app/domain/entities/sensor_reading.dart';
import 'package:air_high_quality_app/domain/failures/failure.dart';
import 'package:air_high_quality_app/domain/repositories/sensor_repository.dart';
import 'package:fpdart/fpdart.dart';

final class SensorRepositoryImpl implements SensorRepository {
  SensorRepositoryImpl(this._datasource);
  final SensorRemoteDatasource _datasource;
  final Queue<SensorReading> _history = Queue();

  @override
  Future<Either<Failure, SensorReading>> fetchLatestReading() async {
    final result = await _datasource.fetchLatestReading();
    return result.map((reading) {
      _bufferReading(reading);
      return reading;
    });
  }

  @override
  List<SensorReading> get historicalReadings => List.unmodifiable(_history);
  void _bufferReading(SensorReading reading) {
    if (_history.length >= AppConstants.maxHistoricalReadings) {
      _history.removeFirst();
    }
    _history.addLast(reading);
  }
}
