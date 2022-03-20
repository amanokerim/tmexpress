import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/profile.dart';
import '../../errors/failures.dart';
import '../../repositories/profile_repository.dart';
import '../usecase.dart';

@lazySingleton
class EditProfileUseCase extends UseCase<void, Profile> {
  EditProfileUseCase(this._profileRepository);
  final ProfileRepository _profileRepository;

  @override
  Future<Either<Failure, void>> call(Profile params) =>
      _profileRepository.editProfile(params);
}
