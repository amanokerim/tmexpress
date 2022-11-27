import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/preferences_repository.dart';
import '../../presentation/utils/constants.dart';
import '../local/data_keys.dart';

@LazySingleton(as: PreferencesRepository)
class PreferencesRepositoryImpl extends PreferencesRepository {
  PreferencesRepositoryImpl() : _preferences = Hive.box<dynamic>(kDataBox);

  final Box<dynamic> _preferences;

  @override
  bool? getBoolPreference(String key) => _preferences.get(key) as bool?;

  @override
  int? getIntPreference(String key) => _preferences.get(key) as int?;

  @override
  double? getDoublePreference(String key) => _preferences.get(key) as double?;

  @override
  String? getStringPreference(String key) => _preferences.get(key) as String?;

  @override
  Future<void> setPreference(String key, dynamic val) =>
      _preferences.put(key, val);

  @override
  String? getJwt() => getStringPreference(pJWT);
}
