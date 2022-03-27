import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/profile.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/profile/auth_usecase.dart';
import '../../presentation/utils/constants.dart';
import '../error/exception_handler.dart';
import '../local/preferences.dart';
import '../mappers/response_mappers/profile_response_mapper.dart';
import '../mappers/response_mappers/token_response_mapper.dart';
import '../network/auth_network.dart';
import '../network/common_network.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(
    this._exception,
    this._commonNetwork,
    this._preferences,
    this._tokenResponseMapper,
    this._authNetwork,
    this._profileResponseMapper,
  );

  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final AuthNetwork _authNetwork;
  final Preferences _preferences;
  final TokenResponseMapper _tokenResponseMapper;
  final ProfileResponseMapper _profileResponseMapper;

  @override
  Future<Either<Failure, bool>> auth(AuthParams params) {
    return _exception.handle(() async {
      final box = Hive.box<String>(kDataBox);
      final referralUserId = box.get(kRegisterReferral);
      print('** auth with referral user id: $referralUserId');
      final token = await _commonNetwork
          .auth(params.phone, params.code, box.get(kRegisterReferral))
          .then(_tokenResponseMapper.map);
      // delete referral user from data, if successfully signed in
      if (referralUserId != null && token.access.isNotEmpty) {
        await box.delete(kRegisterReferral);
        print('** delete referal user id');
      }
      await _preferences.setJwt(token.access);
      return true;
    });
  }

  @override
  Future<Either<Failure, Profile>> fetchProfile() {
    return _exception.handle(() async {
      final profile =
          await _authNetwork.fetchProfile().then(_profileResponseMapper.map);
      return profile;
    });
  }

  @override
  Future<Either<Failure, void>> editProfile(Profile profile) {
    return _exception.handle(() async {
      await _authNetwork.editProfile(profile);
    });
  }
}
