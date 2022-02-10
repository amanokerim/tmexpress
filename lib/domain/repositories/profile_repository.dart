import 'package:dartz/dartz.dart';

import '../entities/profile.dart';
import '../errors/failures.dart';
import '../usecases/profile/auth_usecase.dart';

abstract class ProfileRepository {
  Future<Either<Failure, bool>> auth(AuthParams params);

  Future<Either<Failure, Profile>> fetchProfile();
}
