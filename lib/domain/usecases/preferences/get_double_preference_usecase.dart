import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/app_error.dart';
import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetDoublePreferenceUseCase extends UseCase<double?, String> {
  GetDoublePreferenceUseCase(this._preferencesRepository);
  final PreferencesRepository _preferencesRepository;

  @override
  Future<Either<AppError, double?>> call(String params) =>
      _preferencesRepository.getDoublePreference(key: params);
}
