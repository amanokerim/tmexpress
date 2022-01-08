import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../app/env/env.dart';
import '../../domain/errors/error_types.dart';
import '../../domain/errors/failures.dart';
import 'error_mapper.dart';

@lazySingleton
class ExceptionHandler {
  ExceptionHandler(this._errorMapper);
  final ErrorMapper _errorMapper;

  Future<Either<Failure, T>> handle<T>(Function function) async {
    try {
      return Right(await function());
    } on Exception catch (exception, s) {
      _log(exception, s);
      return Left(_errorMapper.map(exception));
    } on Object catch (e, s) {
      _log(e, s);
      return const Left(AppFailure(appErrorType: AppErrorType.unknownError));
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
