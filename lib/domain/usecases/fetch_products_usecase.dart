import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/pagination.dart';
import '../entities/product_mini.dart';
import '../entities/product_parent.dart';
import '../errors/failures.dart';
import '../repositories/product_repository.dart';
import 'usecase.dart';

@lazySingleton
class FetchProductsUseCase
    extends UseCase<Pagination<ProductMini>, FetchProductsParams> {
  FetchProductsUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, Pagination<ProductMini>>> call(
      FetchProductsParams params) {
    return _productRepository.fetchProducts(params);
  }
}

class FetchProductsParams {
  const FetchProductsParams({
    required this.productParent,
    this.next,
  });
  final ProductParent productParent;
  final String? next;
}
