import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/app_error.dart';
import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetStringPreferenceUseCase extends UseCase<String?, String> {
  GetStringPreferenceUseCase(this._globalRepository);
  final PreferencesRepository _globalRepository;

  @override
  Future<Either<AppError, String?>> call(String params) =>
      _globalRepository.getStringPreference(key: params);
}
