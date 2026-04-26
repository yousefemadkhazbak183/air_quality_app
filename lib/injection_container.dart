import 'package:air_high_quality_app/domain/useCases/fetch_and_sync_use_case.dart';
import 'package:air_high_quality_app/domain/useCases/get_readings_stream_use_case.dart';
import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/app_constants.dart';
import 'data/datasources/sensor_http_datasource_impl.dart';
import 'data/datasources/sensor_supabase_datasource_impl.dart';
import 'data/repositories/sensor_repository_impl.dart';
import 'domain/repositories/sensor_repository.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );

  // HTTP
  sl.registerLazySingleton<http.Client>(http.Client.new);

  // Supabase
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // Datasources
  sl.registerLazySingleton<SensorHttpDatasourceImpl>(
    () => SensorHttpDatasourceImpl(sl<http.Client>()),
  );
  sl.registerLazySingleton<SensorSupabaseDatasourceImpl>(
    () => SensorSupabaseDatasourceImpl(sl<SupabaseClient>()),
  );

  // Repositories
  sl.registerLazySingleton<SensorRepository>(
    () => SensorRepositoryImpl(
      httpDatasource: sl<SensorHttpDatasourceImpl>(),
      supabaseDatasource: sl<SensorSupabaseDatasourceImpl>(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => FetchAndSyncUseCase(sl<SensorRepository>()));
  sl.registerLazySingleton(
    () => GetReadingsStreamUseCase(sl<SensorRepository>()),
  );

  // Cubits
  sl.registerFactory(
    () => SensorDataCubit(
      fetchAndSync: sl<FetchAndSyncUseCase>(),
      getReadingsStream: sl<GetReadingsStreamUseCase>(),
    ),
  );
}
