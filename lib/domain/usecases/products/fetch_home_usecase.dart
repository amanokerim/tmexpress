import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/home.dart';
import '../../errors/failures.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchHomeUseCase extends UseCaseWithoutParams<Home> {
  FetchHomeUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, Home>> call() {
    return _productRepository.fetchHome();
  }
}
