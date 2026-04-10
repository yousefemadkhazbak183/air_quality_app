import '../entities/sensor_reading.dart';

abstract interface class SensorRepository {
  Stream<SensorReading> get sensorStream;

  List<SensorReading> get historicalReadings;
}
