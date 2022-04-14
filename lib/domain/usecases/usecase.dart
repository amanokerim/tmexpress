import 'package:dartz/dartz.dart';

import '../errors/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  Future<Either<AppError, Type>> call();
}
