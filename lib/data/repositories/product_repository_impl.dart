import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/product_repository.dart';
import '../error/exception_handler.dart';
import '../mappers/response_mappers/product_response_mapper.dart';
import '../network/common_network.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
      this._commonNetwork, this._productResponseMapper, this._exception);
  final CommonNetwork _commonNetwork;
  final ProductResponseMapper _productResponseMapper;
  final ExceptionHandler _exception;

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() {
    return _exception.handle<List<Product>>(() async {
      final result = await _commonNetwork
          .fetchProducts()
          .then(_productResponseMapper.mapList);
      return result;
    });
  }
}
