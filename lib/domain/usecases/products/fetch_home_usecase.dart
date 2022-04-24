import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/product/home.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchHomeUseCase extends UseCaseWithoutParams<Home> {
  FetchHomeUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, Home>> call() => _productRepository.fetchHome();
}
