import 'package:equatable/equatable.dart';

import 'app_error_type.dart';

class AppError extends Equatable {
  const AppError(this.type, this.message, {this.shouldRetry = true});

  final AppErrorType type;
  final String message;
  final bool shouldRetry;

  bool get isAuth => type == AppErrorType.accessTokenError;

  @override
  List<Object?> get props => [type];
}
