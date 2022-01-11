import 'package:dartz/dartz.dart';

import '../entities/category/category.dart';
import '../errors/failures.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> fetchCategories();
}
