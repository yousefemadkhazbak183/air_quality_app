import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/sensor_http_datasource_impl.dart';
import 'data/datasources/sensor_remote_datasource.dart';
import 'data/repositories/sensor_repository_impl.dart';
import 'domain/repositories/sensor_repository.dart';
import 'domain/usecases/fetch_sensor_reading_usecase.dart';
import 'domain/usecases/get_historical_readings_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  // HTTP
  sl.registerLazySingleton<http.Client>(http.Client.new);

  // Datasources
  sl.registerLazySingleton<SensorRemoteDatasource>(
    () => SensorHttpDatasourceImpl(sl<http.Client>()),
  );

  // Repositories
  sl.registerLazySingleton<SensorRepository>(
    () => SensorRepositoryImpl(sl<SensorRemoteDatasource>()),
  );

  // Usecases
  sl.registerLazySingleton(
    () => FetchSensorReadingUseCase(sl<SensorRepository>()),
  );
  sl.registerLazySingleton(
    () => GetHistoricalReadingsUseCase(sl<SensorRepository>()),
  );

  // Cubits
  sl.registerFactory(
    () => SensorDataCubit(
      fetchSensorReading: sl<FetchSensorReadingUseCase>(),
      getHistoricalReadings: sl<GetHistoricalReadingsUseCase>(),
    ),
  );
}
