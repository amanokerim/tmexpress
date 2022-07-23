import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/saved_product.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchFavoriteProductsUseCase
    extends UseCaseWithoutParams<List<SavedProduct>> {
  FetchFavoriteProductsUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, List<SavedProduct>>> call() =>
      _productRepository.fetchFavoriteProducts();
}
