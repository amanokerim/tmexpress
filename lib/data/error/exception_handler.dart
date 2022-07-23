import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../app/env/env.dart';
import '../../app/generated/l10n.dart';
import '../../domain/errors/app_error.dart';
import '../../domain/errors/app_error_type.dart';
import 'error_mapper.dart';

@lazySingleton
class ExceptionHandler {
  ExceptionHandler(this._errorMapper);
  final ErrorMapper _errorMapper;

  Future<Either<AppError, T>> handle<T>(Function function) async {
    try {
      return Right(await function());
    } on Exception catch (exception, s) {
      _log(exception, s);
      return Left(_errorMapper.map(exception));
    } on Object catch (e, s) {
      _log(e, s);
      return Left(
        AppError(AppErrorType.unknownError, S.current.somethingWentWrong),
      );
    }
  }

  void _log(Object e, StackTrace s) {
    if (Env.value.writeLogs) {
      print('=== Exception (Object) ===');
      print(e);
      print(s);
    }
  }
}
