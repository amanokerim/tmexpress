import 'package:equatable/equatable.dart';

import 'error_types.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message, required this.serverErrorType})
      : super(message: message);
  final ServerErrorType serverErrorType;

  @override
  List<Object?> get props => [message, serverErrorType];
}

class AppFailure extends Failure {
  const AppFailure({required this.appErrorType}) : super(message: '');
  final AppErrorType appErrorType;

  @override
  List<Object?> get props => [message, appErrorType];
}
