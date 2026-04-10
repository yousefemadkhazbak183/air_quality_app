import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

final class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

final class DataParsingFailure extends Failure {
  const DataParsingFailure({required super.message});
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
}
