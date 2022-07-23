import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';

@lazySingleton
class GetBoolPreferenceUseCase {
  GetBoolPreferenceUseCase(this._preferencesRepository);
  final PreferencesRepository _preferencesRepository;

  bool? call(String key) => _preferencesRepository.getBoolPreference(key);
}
