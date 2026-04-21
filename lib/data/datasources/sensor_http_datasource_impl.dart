import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/app_constants.dart';
import '../../domain/failures/failure.dart';
import '../models/sensor_reading_model.dart';
import 'sensor_remote_datasource.dart';

final class SensorHttpDatasourceImpl implements SensorRemoteDatasource {
  const SensorHttpDatasourceImpl(this._client);

  final http.Client _client;

  @override
  Future<Either<Failure, SensorReadingModel>> fetchLatestReading() async {
    try {
      final uri = Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.sensorDataEndpoint}',
      );

      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 5));

      if (response.statusCode != 200) {
        return Left(
          NetworkFailure(message: 'Server error: ${response.statusCode}'),
        );
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return Right(SensorReadingModel.fromJson(json));
    } on Exception catch (error) {
      return Left(NetworkFailure(message: 'Connection failed: $error'));
    }
  }
}
