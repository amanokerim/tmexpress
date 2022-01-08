import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, bool?>> getBoolPreference({required String key});

  Future<Either<Failure, int?>> getIntPreference({required String key});

  Future<Either<Failure, double?>> getDoublePreference({required String key});

  Future<Either<Failure, String?>> getStringPreference({required String key});

  Future<Either<Failure, void>> setPreference(
      {required String key, required dynamic val});
}
