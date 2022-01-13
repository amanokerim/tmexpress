import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../entities/home.dart';
import '../errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Category>>> fetchCategories();

  Future<Either<Failure, Home>> fetchHome();
}
