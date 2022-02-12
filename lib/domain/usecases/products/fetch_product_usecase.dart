import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../entities/product.dart';
import '../../errors/failures.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchProductUseCase extends UseCase<Product, int> {
  FetchProductUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, Product>> call(int id) {
    return _productRepository.fetchProduct(id);
  }
}
