import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/pagination.dart';
import '../../entities/product_mini.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class SearchProductsUseCase
    extends UseCase<Pagination<ProductMini>, SearchParams> {
  SearchProductsUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, Pagination<ProductMini>>> call(SearchParams params) =>
      params.query.isNotEmpty
          ? _productRepository.searchProducts(params)
          : _productRepository.fetchHotProducts(params.next);
}

class SearchParams {
  SearchParams({required this.query, this.next});

  final String query;
  final String? next;
}
