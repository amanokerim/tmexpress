import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/product/brand.dart';
import '../../entities/product/pagination.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchBrandsUseCase extends UseCase<PaginationM<Brand>, String?> {
  FetchBrandsUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, PaginationM<Brand>>> call(String? next) =>
      _productRepository.fetchBrands(next);
}
