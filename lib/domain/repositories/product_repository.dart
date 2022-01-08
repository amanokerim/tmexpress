import 'package:dartz/dartz.dart';

import '../entities/product.dart';
import '../errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> fetchProducts();
}
