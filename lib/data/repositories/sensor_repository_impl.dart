import 'dart:collection';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/sensor_reading.dart';
import '../../domain/repositories/sensor_repository.dart';
import '../datasources/sensor_remote_datasource.dart';

final class SensorRepositoryImpl implements SensorRepository {
  SensorRepositoryImpl(this._datasource);

  final SensorRemoteDatasource _datasource;
  final Queue<SensorReading> _history = Queue();

  @override
  Stream<SensorReading> get sensorStream =>
      _datasource.sensorStream.map(_bufferAndReturn);

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
