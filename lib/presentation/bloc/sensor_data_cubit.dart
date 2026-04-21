import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_constants.dart';
import '../../../domain/usecases/fetch_sensor_reading_usecase.dart';
import '../../../domain/usecases/get_historical_readings_usecase.dart';
import 'sensor_data_state.dart';

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

  void startPolling() {
    emit(const SensorDataLoading());
    _fetchAndEmit();
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

  void retry() {
    _pollingTimer?.cancel();
    startPolling();
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }
}
