import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/env/env.dart';
import '../../app/generated/l10n.dart';
import '../../domain/errors/error_types.dart';
import '../../domain/errors/failures.dart';

abstract class AppBloc<Event, State> extends Bloc<Event, State> {
  AppBloc(State initialState) : super(initialState);

  String mapError(Failure failure) {
    if (Env.value.writeLogs) print(failure.message);
    switch (failure.runtimeType) {
      case ServerFailure:
        switch ((failure as ServerFailure).serverErrorType) {
          case ServerErrorType.accessTokenError:
          case ServerErrorType.serverIsNotAvailable:
          case ServerErrorType.connectionError:
            return S.current.loadError;
          case ServerErrorType.connectionTimeout:
            return S.current.connectionError;
          case ServerErrorType.apiResponseParsingError:
          case ServerErrorType.badRequest:
          case ServerErrorType.resourceNotFound:
          case ServerErrorType.methodNotAllowed:
          case ServerErrorType.internalServerError:
          case ServerErrorType.badGateway:
          case ServerErrorType.somethingWentWrong:
            return S.current.somethingWentWrong;
          case ServerErrorType.forbidden:
            return S.current.forbidden;
          // TODO Custom codes
        }
      case AppFailure:
        switch ((failure as AppFailure).appErrorType) {
          case AppErrorType.unknownError:
            return S.current.unknownError;
        }

      default:
        return S.current.somethingWentWrong;
    }
  }

  bool isAuthError(Failure failure) =>
      failure is ServerFailure &&
      failure.serverErrorType == ServerErrorType.accessTokenError;
}
