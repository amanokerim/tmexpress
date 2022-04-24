import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';

@lazySingleton
class SetPreferenceUseCase {
  SetPreferenceUseCase(this._preferencesRepository);
  final PreferencesRepository _preferencesRepository;

  Future<void> call(SetPreferenceParams params) =>
      _preferencesRepository.setPreference(params.key, params.val);
}

class SetPreferenceParams {
  SetPreferenceParams({required this.key, required this.val});

  final String key;
  final dynamic val;
}
