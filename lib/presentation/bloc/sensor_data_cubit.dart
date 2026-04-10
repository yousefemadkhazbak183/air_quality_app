import 'package:air_high_quality_app/core/constants/app_constants.dart';
import 'package:air_high_quality_app/domain/usecases/fetch_sensor_reading_usecase.dart';
import 'package:air_high_quality_app/domain/usecases/get_historical_readings_usecase.dart';
import 'package:air_high_quality_app/presentation/bloc/sensor_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

final class SensorDataCubit extends Cubit<SensorDataState> {
  SensorDataCubit({
    required FetchSensorReadingUseCase fetchSensorReading,
    required GetHistoricalReadingsUseCase getHistoricalReadings,
  }) : _fetchSensorReading = fetchSensorReading,
       _getHistoricalReadings = getHistoricalReadings,
       super(const SensorDataInitial());

  final FetchSensorReadingUseCase _fetchSensorReading;
  final GetHistoricalReadingsUseCase _getHistoricalReadings;
  Timer? _pollingTimer;

  Future<void> startPolling() async {
    emit(SensorDataLoading());
    await _fetchAndEmit();

    _pollingTimer = Timer.periodic(
      AppConstants.pollingInterval,
      (_) => _fetchAndEmit(),
    );
  }

  Future<void> _fetchAndEmit() async {
    final result = await _fetchSensorReading();

    result.fold(
      (failure) => emit(SensorDataError(message: failure.message)),
      (reading) => emit(
        SensorDataUpdated(reading: reading, history: _getHistoricalReadings()),
      ),
    );
  }

  Future<void> retry() async {
    await startPolling();
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }
}
