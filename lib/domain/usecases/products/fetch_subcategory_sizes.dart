import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/product/size.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchSubcategorySizesUseCase extends UseCase<List<Size>, int> {
  FetchSubcategorySizesUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, List<Size>>> call(int id) =>
      _productRepository.fetchSubcategorySizes(id);
}
