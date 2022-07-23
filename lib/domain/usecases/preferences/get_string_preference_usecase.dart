import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';

@lazySingleton
class GetStringPreferenceUseCase {
  GetStringPreferenceUseCase(this._globalRepository);
  final PreferencesRepository _globalRepository;

  String? call(String key) => _globalRepository.getStringPreference(key);
}
