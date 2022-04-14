import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/app_error.dart';
import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetBoolPreferenceUseCase extends UseCase<bool?, String> {
  GetBoolPreferenceUseCase(this._preferencesRepository);
  final PreferencesRepository _preferencesRepository;

  @override
  Future<Either<AppError, bool?>> call(String params) =>
      _preferencesRepository.getBoolPreference(key: params);
}
