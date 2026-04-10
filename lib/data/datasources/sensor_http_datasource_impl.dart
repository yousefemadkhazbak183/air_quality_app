import 'dart:convert';

import 'package:air_high_quality_app/core/constants/app_constants.dart';
import 'package:air_high_quality_app/data/datasources/sensor_remote_datasource.dart';
import 'package:air_high_quality_app/data/models/sensor_reading_model.dart';
import 'package:air_high_quality_app/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

final class SensorHttpDatasourceImpl implements SensorRemoteDatasource {
  const SensorHttpDatasourceImpl(this._client);
  final http.Client _client;

  @override
  Future<Either<Failure, SensorReadingModel>> fetchLatestReading() async {
    try {
      final response = await _client
          .get(
            Uri.parse(
              "${AppConstants.baseUrl}${AppConstants.sensorDataEndpoint}",
            ),
          )
          .timeout(Duration(seconds: 5));

      if (response.statusCode != 200) {
        return Left(
          NetworkFailure(message: 'Server Error: ${response.statusCode}'),
        );
      }
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return Right(SensorReadingModel.fromJson(json));
    } on Exception catch (e) {
      return Left(NetworkFailure(message: 'Connection Failure: $e'));
    }
  }
}
