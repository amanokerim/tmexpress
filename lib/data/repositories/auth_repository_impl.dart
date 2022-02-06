import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/errors/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth/auth_usecase.dart';
import '../error/exception_handler.dart';
import '../local/preferences.dart';
import '../mappers/response_mappers/token_response_mapper.dart';
import '../network/common_network.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._exception, this._commonNetwork, this._preferences,
      this._tokenResponseMapper);

  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final Preferences _preferences;
  final TokenResponseMapper _tokenResponseMapper;

  @override
  Future<Either<Failure, bool>> auth(AuthParams params) {
    return _exception.handle(() async {
      final token = await _commonNetwork
          .auth(params.phone, params.code)
          .then(_tokenResponseMapper.map);
      await _preferences.setJwt(token.access);
      return true;
    });
  }
}
