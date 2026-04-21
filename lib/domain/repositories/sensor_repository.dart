import 'package:fpdart/fpdart.dart';

import '../entities/sensor_reading.dart';
import '../failures/failure.dart';

abstract interface class SensorRepository {
  Future<Either<Failure, SensorReading>> fetchAndSync();
  Stream<List<SensorReading>> get readingsStream;
  List<SensorReading> get historicalReadings;
}
