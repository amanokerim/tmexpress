import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/failures.dart';
import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetIntPreferenceUseCase extends UseCase<int?, String> {
  GetIntPreferenceUseCase(this._globalRepository);
  final PreferencesRepository _globalRepository;

  @override
  Future<Either<Failure, int?>> call(String params) =>
      _globalRepository.getIntPreference(key: params);
}
