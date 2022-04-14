import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/errors/app_error.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../error/exception_handler.dart';
import '../local/preferences.dart';

@LazySingleton(as: PreferencesRepository)
class PreferencesRepositoryImpl extends PreferencesRepository {
  PreferencesRepositoryImpl(
    this._exception,
    this._preferences,
  );
  final Preferences _preferences;
  final ExceptionHandler _exception;

  @override
  Future<Either<AppError, bool?>> getBoolPreference(
      {required String key}) async {
    return _exception.handle(() => _preferences.getBoolPreference(key));
  }

  @override
  Future<Either<AppError, int?>> getIntPreference({required String key}) async {
    return _exception.handle(() => _preferences.getIntPreference(key));
  }

  @override
  Future<Either<AppError, double?>> getDoublePreference(
      {required String key}) async {
    return _exception.handle(() => _preferences.getDoublePreference(key));
  }

  @override
  Future<Either<AppError, String?>> getStringPreference(
      {required String key}) async {
    return _exception.handle(() => _preferences.getStringPreference(key));
  }

  @override
  Future<Either<AppError, bool>> setPreference(
      {required String key, required dynamic val}) async {
    return _exception.handle(() => _preferences.setPreference(key, val));
  }
}
