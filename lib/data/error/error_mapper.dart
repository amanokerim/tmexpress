import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/errors/error_types.dart';
import '../../domain/errors/failures.dart';

@LazySingleton()
class ErrorMapper {
  Failure map(Exception exception) {
    var errorType = ServerErrorType.somethingWentWrong;
    String? message;

    if (exception is TimeoutException) {
      errorType = ServerErrorType.connectionTimeout;
    } else if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.sendTimeout:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorType = ServerErrorType.connectionTimeout;
          break;
        case DioErrorType.response:
          switch (exception.response?.statusCode) {
            // Standard errors
            case 400:
              errorType = ServerErrorType.badRequest;
              break;
            case 401:
              errorType = ServerErrorType.accessTokenError;
              break;
            case 403:
              errorType = ServerErrorType.forbidden;
              break;
            case 404:
              errorType = ServerErrorType.resourceNotFound;
              break;
            case 405:
              errorType = ServerErrorType.methodNotAllowed;
              break;
            case 500:
              errorType = ServerErrorType.internalServerError;
              break;
            case 502:
              errorType = ServerErrorType.badGateway;
              break;

            // TODO Custom errors

          }
          break;
        case DioErrorType.other:
        case DioErrorType.cancel:
          errorType = ServerErrorType.connectionError;
          break;
      }
    }
    return ServerFailure(
      message: message ?? exception.toString(),
      serverErrorType: errorType,
    );
  }
}
