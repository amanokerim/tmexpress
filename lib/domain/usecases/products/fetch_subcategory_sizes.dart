import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/size.dart';
import '../../errors/failures.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchSubcategorySizesUseCase extends UseCase<List<Size>, int> {
  FetchSubcategorySizesUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, List<Size>>> call(int id) {
    return _productRepository.fetchSubcategorySizes(id);
  }
}
