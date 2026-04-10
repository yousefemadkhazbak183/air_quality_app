import '../../domain/entities/sensor_reading.dart';

abstract interface class SensorRemoteDatasource {
  Stream<SensorReading> get sensorStream;
}
