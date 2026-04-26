import 'dart:collection';

import 'package:fpdart/fpdart.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/sensor_reading.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/sensor_repository.dart';
import '../datasources/sensor_http_datasource_impl.dart';
import '../datasources/sensor_supabase_datasource_impl.dart';
import '../models/sensor_reading_model.dart';

final class SensorRepositoryImpl implements SensorRepository {
  SensorRepositoryImpl({
    required this.httpDatasource,
    required this.supabaseDatasource,
  });

  final SensorHttpDatasourceImpl httpDatasource;
  final SensorSupabaseDatasourceImpl supabaseDatasource;

  final Queue<SensorReading> _history = Queue();

  @override
  Future<Either<Failure, SensorReading>> fetchAndSync() async {
    final result = await httpDatasource.fetchLatestReading();

    return result.fold(Left.new, (reading) async {
      await supabaseDatasource.saveReading(reading);
      _bufferReading(reading);
      return Right(reading);
    });
  }

  @override
  Stream<List<SensorReading>> get readingsStream =>
      supabaseDatasource.readingsStream.map(
        (rows) => rows.map((row) => SensorReadingModel.fromJson(row)).toList(),
      );

  @override
  List<SensorReading> get historicalReadings => List.unmodifiable(_history);

  void _bufferReading(SensorReading reading) {
    if (_history.length >= AppConstants.maxHistoricalReadings) {
      _history.removeFirst();
    }
    _history.addLast(reading);
  }
}
