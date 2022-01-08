import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/product.dart';
import '../errors/failures.dart';
import '../repositories/product_repository.dart';
import 'usecase.dart';

@lazySingleton
class FetchProductsUseCase extends UseCaseWithoutParams<List<Product>> {
  FetchProductsUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, List<Product>>> call() {
    return _productRepository.fetchProducts();
  }
}
