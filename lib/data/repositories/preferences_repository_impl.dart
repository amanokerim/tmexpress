import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/errors/error_types.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../error/error_mapper.dart';
import '../local/preferences.dart';

@LazySingleton(as: PreferencesRepository)
class PreferencesRepositoryImpl extends PreferencesRepository {
  PreferencesRepositoryImpl(
    this._errorMapper,
    this._preferences,
  );
  final Preferences _preferences;
  final ErrorMapper _errorMapper;

  @override
  Future<Either<Failure, bool?>> getBoolPreference(
      {required String key}) async {
    try {
      final result = _preferences.getBoolPreference(key);
      return Right(result);
    } on Exception catch (exception) {
      return Left(_errorMapper.map(exception));
    } on Object catch (_) {
      return const Left(AppFailure(appErrorType: AppErrorType.unknownError));
    }
  }

  @override
  Future<Either<Failure, int?>> getIntPreference({required String key}) async {
    try {
      final result = _preferences.getIntPreference(key);
      return Right(result);
    } on Exception catch (exception) {
      return Left(_errorMapper.map(exception));
    } on Object catch (_) {
      return const Left(AppFailure(appErrorType: AppErrorType.unknownError));
    }
  }

  @override
  Future<Either<Failure, double?>> getDoublePreference(
      {required String key}) async {
    try {
      final result = _preferences.getDoublePreference(key);
      return Right(result);
    } on Exception catch (exception) {
      return Left(_errorMapper.map(exception));
    } on Object catch (_) {
      return const Left(AppFailure(appErrorType: AppErrorType.unknownError));
    }
  }

  @override
  Future<Either<Failure, String?>> getStringPreference(
      {required String key}) async {
    try {
      final result = _preferences.getStringPreference(key);
      return Right(result);
    } on Exception catch (exception) {
      return Left(_errorMapper.map(exception));
    } on Object catch (_) {
      return const Left(AppFailure(appErrorType: AppErrorType.unknownError));
    }
  }

  @override
  Future<Either<Failure, bool>> setPreference(
      {required String key, required dynamic val}) async {
    try {
      final result = await _preferences.setPreference(key, val);
      return Right(result);
    } on Exception catch (exception) {
      return Left(_errorMapper.map(exception));
    } on Object catch (_) {
      return const Left(AppFailure(appErrorType: AppErrorType.unknownError));
    }
  }
}
