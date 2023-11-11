import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../app/generated/l10n.dart';
import '../../domain/errors/app_error.dart';
import '../../domain/errors/app_error_type.dart';

@LazySingleton()
class ErrorMapper {
  AppError map(Exception exception) {
    final timeoutError =
        AppError(AppErrorType.connectionTimeout, S.current.connectionError);

    if (exception is TimeoutException) {
      return timeoutError;
    } else if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return timeoutError;
        case DioExceptionType.badResponse:
          switch (exception.response?.statusCode) {
            case 400:
              return AppError(AppErrorType.somethingWentWrong,
                  S.current.somethingWentWrong);
            case 401:
              return AppError(
                  AppErrorType.accessTokenError, S.current.loadError);
            case 403:
              return AppError(AppErrorType.forbidden, S.current.forbidden);
            case 404:
              return AppError(
                  AppErrorType.resourceNotFound, S.current.somethingWentWrong,
                  shouldRetry: false);
            case 405:
              return AppError(
                  AppErrorType.methodNotAllowed, S.current.somethingWentWrong);
            case 500:
              return AppError(
                  AppErrorType.internalServerError, S.current.serverError);
            case 502:
              return AppError(AppErrorType.badGateway, S.current.serverError);
          }
          break;
        default:
          return AppError(AppErrorType.connectionError, S.current.loadError);
      }
    }
    return AppError(
        AppErrorType.somethingWentWrong, S.current.somethingWentWrong);
  }
}
