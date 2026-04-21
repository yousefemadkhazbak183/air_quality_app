import 'package:air_high_quality_app/core/constants/app_constants.dart';
import 'package:air_high_quality_app/data/models/sensor_reading_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SensorSupabaseDatasourceImpl {
  const SensorSupabaseDatasourceImpl(this._client);

  final SupabaseClient _client;
  Future<void> saveReading(SensorReadingModel readingModel) async {
    await _client
        .from(AppConstants.sensorReadingsTable)
        .insert(readingModel.toJson());
  }

  Stream<List<Map<String, dynamic>>> get readingStream => _client
      .from(AppConstants.sensorReadingsTable)
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: false)
      .limit(AppConstants.maxHistoricalReadings);
}
