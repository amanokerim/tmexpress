// ignore_for_file: lines_longer_than_80_chars

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'keys.dart';

@lazySingleton
class Preferences {
  Preferences(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  String? getJwt() {
    return _sharedPreferences.getString(pJWT);
  }

  Future<bool> setJwt(String? jwt) {
    if (jwt == null) {
      return _sharedPreferences.remove(pJWT);
    } else {
      return _sharedPreferences.setString(pJWT, jwt);
    }
  }

  bool? getBoolPreference(String key) => _sharedPreferences.getBool(key);

  int? getIntPreference(String key) => _sharedPreferences.getInt(key);

  double? getDoublePreference(String key) => _sharedPreferences.getDouble(key);

  String? getStringPreference(String key) => _sharedPreferences.getString(key);

  Future<bool> setPreference(String key, dynamic val) {
    final userKey = key;
    if (val == null) {
      return _sharedPreferences.remove(userKey);
    } else if (val is bool) {
      return _sharedPreferences.setBool(userKey, val);
    } else if (val is String) {
      return _sharedPreferences.setString(userKey, val);
    } else if (val is int) {
      return _sharedPreferences.setInt(userKey, val);
    } else if (val is double) {
      return _sharedPreferences.setDouble(userKey, val);
    }
    return Future.value(false);
  }
}
// ignore_for_file: avoid_positional_boolean_parameters
