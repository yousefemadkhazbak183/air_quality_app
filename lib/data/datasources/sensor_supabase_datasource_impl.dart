import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/sensor_reading.dart';
import '../models/sensor_reading_model.dart';
import 'sensor_remote_datasource.dart';

final class SensorSupabaseDatasourceImpl implements SensorRemoteDatasource {
  const SensorSupabaseDatasourceImpl(this._client);

  final SupabaseClient _client;

  @override
  Stream<SensorReading> get sensorStream => _client
      .from(AppConstants.sensorReadingsTable)
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: false)
      .limit(1)
      .map((rows) => SensorReadingModel.fromJson(rows.first));
}
