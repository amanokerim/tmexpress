import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/failures.dart';
import '../../repositories/profile_repository.dart';
import '../usecase.dart';

@lazySingleton
class AuthUseCase extends UseCase<bool, AuthParams> {
  AuthUseCase(this._authRepository);
  final ProfileRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(AuthParams params) {
    return _authRepository.auth(params);
  }
}

class AuthParams {
  AuthParams(this.phone, this.code);

  final String phone; // own phone number
  final int code; // code from sms
}
