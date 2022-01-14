import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../errors/failures.dart';
import '../repositories/product_repository.dart';
import 'usecase.dart';

@lazySingleton
class FetchCategoriesUseCase extends UseCaseWithoutParams<List<Category>> {
  FetchCategoriesUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, List<Category>>> call() {
    return _productRepository.fetchCategories();
  }
}
