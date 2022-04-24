import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';

@lazySingleton
class GetDoublePreferenceUseCase {
  GetDoublePreferenceUseCase(this._preferencesRepository);
  final PreferencesRepository _preferencesRepository;

  double? call(String key) => _preferencesRepository.getDoublePreference(key);
}
