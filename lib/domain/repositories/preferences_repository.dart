import 'package:dartz/dartz.dart';

import '../errors/app_error.dart';

abstract class PreferencesRepository {
  Future<Either<AppError, bool?>> getBoolPreference({required String key});

  Future<Either<AppError, int?>> getIntPreference({required String key});

  Future<Either<AppError, double?>> getDoublePreference({required String key});

  Future<Either<AppError, String?>> getStringPreference({required String key});

  Future<Either<AppError, void>> setPreference(
      {required String key, required dynamic val});
}
