import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/saved_product.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class LikeProductUseCase extends UseCase<void, SavedProduct> {
  LikeProductUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, void>> call(SavedProduct product) =>
      _productRepository.toggleLike(product);
}
