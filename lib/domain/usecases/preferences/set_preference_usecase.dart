import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/app_error.dart';
import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class SetPreferenceUseCase extends UseCase<void, SetPreferenceParams> {
  SetPreferenceUseCase(this._preferencesRepository);
  final PreferencesRepository _preferencesRepository;

  @override
  Future<Either<AppError, void>> call(SetPreferenceParams params) =>
      _preferencesRepository.setPreference(key: params.key, val: params.val);
}

class SetPreferenceParams {
  SetPreferenceParams({required this.key, required this.val});

  final String key;
  final dynamic val;
}
