import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/banner.dart';
import '../errors/failures.dart';
import '../repositories/product_repository.dart';
import 'usecase.dart';

@lazySingleton
class FetchBannersUseCase extends UseCaseWithoutParams<List<Banner>> {
  FetchBannersUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, List<Banner>>> call() {
    return _productRepository.fetchBanners();
  }
}
