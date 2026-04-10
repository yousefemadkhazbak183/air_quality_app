import 'package:air_high_quality_app/data/datasources/sensor_http_datasource_impl.dart';
import 'package:air_high_quality_app/data/datasources/sensor_remote_datasource.dart';
import 'package:air_high_quality_app/data/repositories/sensor_repository_impl.dart';
import 'package:air_high_quality_app/domain/repositories/sensor_repository.dart';
import 'package:air_high_quality_app/domain/usecases/fetch_sensor_reading_usecase.dart';
import 'package:air_high_quality_app/domain/usecases/get_historical_readings_usecase.dart';
import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> setupInject() async {
  sl.registerLazySingleton<http.Client>(http.Client.new);

  sl.registerLazySingleton<SensorRemoteDatasource>(
    () => SensorHttpDatasourceImpl(sl<http.Client>()),
  );

  sl.registerLazySingleton<SensorRepository>(
    () => SensorRepositoryImpl(sl<SensorRemoteDatasource>()),
  );

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
