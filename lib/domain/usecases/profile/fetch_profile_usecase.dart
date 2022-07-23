import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/profile.dart';
import '../../errors/app_error.dart';
import '../../repositories/profile_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchProfileUseCase extends UseCaseWithoutParams<Profile> {
  FetchProfileUseCase(this._profileRepository);
  final ProfileRepository _profileRepository;

  @override
  Future<Either<AppError, Profile>> call() => _profileRepository.fetchProfile();
}
