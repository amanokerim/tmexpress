abstract class PreferencesRepository {
  String? getJwt();

  bool? getBoolPreference(String key);

  int? getIntPreference(String key);

  double? getDoublePreference(String key);

  String? getStringPreference(String key);

  Future<void> setPreference(String key, dynamic val);
}
