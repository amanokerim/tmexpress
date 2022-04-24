import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';

@lazySingleton
class GetIntPreferenceUseCase {
  GetIntPreferenceUseCase(this._globalRepository);
  final PreferencesRepository _globalRepository;

  int? call(String key) => _globalRepository.getIntPreference(key);
}
