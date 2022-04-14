import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class ShareProductUseCase extends UseCase<void, int> {
  ShareProductUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, void>> call(int id) {
    return _productRepository.share(id);
  }
}
