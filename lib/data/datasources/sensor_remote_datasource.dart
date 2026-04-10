import 'package:fpdart/fpdart.dart';

import '../../domain/failures/failure.dart';
import '../models/sensor_reading_model.dart';

abstract interface class SensorRemoteDatasource {
  Future<Either<Failure, SensorReadingModel>> fetchLatestReading();
}
