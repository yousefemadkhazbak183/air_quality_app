import 'package:equatable/equatable.dart';

import '../../../domain/entities/sensor_reading.dart';

sealed class SensorDataState extends Equatable {
  const SensorDataState();

  @override
  List<Object?> get props => [];
}

final class SensorDataInitial extends SensorDataState {
  const SensorDataInitial();
}

final class SensorDataLoading extends SensorDataState {
  const SensorDataLoading();
}

final class SensorDataUpdated extends SensorDataState {
  const SensorDataUpdated({required this.reading, required this.history});

  final SensorReading reading;
  final List<SensorReading> history;

  @override
  List<Object?> get props => [reading, history];
}

final class SensorDataError extends SensorDataState {
  const SensorDataError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
