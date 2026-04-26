import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/constants/app_constants.dart';
import '../models/sensor_reading_model.dart';

final class SensorSupabaseDatasourceImpl {
  const SensorSupabaseDatasourceImpl(this._client);

  final SupabaseClient _client;

  Future<void> saveReading(SensorReadingModel reading) async {
    await _client
        .from(AppConstants.sensorReadingsTable)
        .insert(reading.toJson());
  }

  Stream<List<Map<String, dynamic>>> get readingsStream => _client
      .from(AppConstants.sensorReadingsTable)
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: false)
      .limit(AppConstants.maxHistoricalReadings);
}
