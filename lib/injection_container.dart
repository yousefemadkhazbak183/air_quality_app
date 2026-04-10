import 'package:air_high_quality_app/data/datasources/sensor_supabase_datasource_impl.dart';
import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/app_constants.dart';
import 'data/datasources/sensor_remote_datasource.dart';
import 'data/repositories/sensor_repository_impl.dart';
import 'domain/repositories/sensor_repository.dart';
import 'domain/usecases/get_historical_readings_usecase.dart';
import 'domain/usecases/get_sensor_stream_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );

  // Supabase client
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // Datasources
  sl.registerLazySingleton<SensorRemoteDatasource>(
    () => SensorSupabaseDatasourceImpl(sl<SupabaseClient>()),
  );

  // Repositories
  sl.registerLazySingleton<SensorRepository>(
    () => SensorRepositoryImpl(sl<SensorRemoteDatasource>()),
  );

  // Usecases
  sl.registerLazySingleton(
    () => GetSensorStreamUseCase(sl<SensorRepository>()),
  );
  sl.registerLazySingleton(
    () => GetHistoricalReadingsUseCase(sl<SensorRepository>()),
  );

  // Cubits
  sl.registerFactory(
    () => SensorDataCubit(
      getSensorStream: sl<GetSensorStreamUseCase>(),
      getHistoricalReadings: sl<GetHistoricalReadingsUseCase>(),
    ),
  );
}
