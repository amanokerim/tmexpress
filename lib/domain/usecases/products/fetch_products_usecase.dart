import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/enums/sort_types.dart';
import '../../entities/product/filter_options.dart';
import '../../entities/product/pagination.dart';
import '../../entities/product/product_mini.dart';
import '../../entities/product/sub_tag.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchProductsUseCase
    extends UseCase<Pagination<ProductMini>, FetchProductsParams> {
  FetchProductsUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, Pagination<ProductMini>>> call(
          FetchProductsParams params) =>
      _productRepository.fetchProducts(params);
}

class FetchProductsParams {
  const FetchProductsParams({
    required this.productParent,
    required this.sortType,
    this.filterOptions,
    this.next,
  });

  final SubTag productParent;
  final String? next;
  final SortType sortType;
  final FilterOptions? filterOptions;
}
