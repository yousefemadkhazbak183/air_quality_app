import 'dart:async';

import 'package:air_high_quality_app/domain/useCases/fetch_and_sync_use_case.dart';
import 'package:air_high_quality_app/domain/useCases/get_readings_stream_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/sensor_reading.dart';

import 'sensor_data_state.dart';

final class SensorDataCubit extends Cubit<SensorDataState> {
  SensorDataCubit({
    required FetchAndSyncUseCase fetchAndSync,
    required GetReadingsStreamUseCase getReadingsStream,
  }) : _fetchAndSync = fetchAndSync,
       _getReadingsStream = getReadingsStream,
       super(const SensorDataInitial());

  final FetchAndSyncUseCase _fetchAndSync;
  final GetReadingsStreamUseCase _getReadingsStream;

  StreamSubscription<List<SensorReading>>? _streamSubscription;
  Timer? _pollingTimer;

  void startListening() {
    emit(const SensorDataLoading());
    _subscribeToStream();
    _startPolling();
  }

  void _subscribeToStream() {
    _streamSubscription = _getReadingsStream().listen(
      (readings) {
        print('Stream received: ${readings.length} readings');
        if (readings.isEmpty) return;
        emit(SensorDataUpdated(reading: readings.first, history: readings));
      },
      onError: (Object error) {
        print('Stream error: $error');
        emit(SensorDataError(message: 'Stream error: $error'));
      },
    );
  }

  void _startPolling() {
    _pollingTimer = Timer.periodic(AppConstants.pollingInterval, (_) async {
      final result = await _fetchAndSync();
      // لو فشل الـ polling مش بنمسح الـ stream data
      result.fold((failure) {
        // بس نعمل error لو مفيش data خالص
        if (state is! SensorDataUpdated) {
          emit(SensorDataError(message: failure.message));
        }
      }, (_) {});
    });
  }

  void retry() {
    _pollingTimer?.cancel();
    _streamSubscription?.cancel();
    startListening();
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    _streamSubscription?.cancel();
    return super.close();
  }
}
