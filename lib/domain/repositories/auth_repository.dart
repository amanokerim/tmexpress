import 'package:dartz/dartz.dart';

import '../errors/failures.dart';
import '../usecases/auth/auth_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> auth(AuthParams params);
}
