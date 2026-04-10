import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_historical_readings_usecase.dart';
import '../../../domain/usecases/get_sensor_stream_usecase.dart';
import 'sensor_data_state.dart';

final class SensorDataCubit extends Cubit<SensorDataState> {
  SensorDataCubit({
    required GetSensorStreamUseCase getSensorStream,
    required GetHistoricalReadingsUseCase getHistoricalReadings,
  }) : _getSensorStream = getSensorStream,
       _getHistoricalReadings = getHistoricalReadings,
       super(const SensorDataInitial());

  final GetSensorStreamUseCase _getSensorStream;
  final GetHistoricalReadingsUseCase _getHistoricalReadings;
  StreamSubscription<dynamic>? _subscription;

  void startListening() {
    emit(const SensorDataLoading());

    _subscription = _getSensorStream().listen(
      (reading) => emit(
        SensorDataUpdated(reading: reading, history: _getHistoricalReadings()),
      ),
      onError: (Object error) =>
          emit(SensorDataError(message: 'Stream error: $error')),
    );
  }

  void retry() {
    _subscription?.cancel();
    startListening();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
