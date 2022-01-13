import 'package:dartz/dartz.dart';

import '../entities/banner.dart';
import '../entities/category.dart';
import '../entities/tag.dart';
import '../errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Category>>> fetchCategories();

  Future<Either<Failure, List<Banner>>> fetchBanners();

  Future<Either<Failure, List<Tag>>> fetchTags();
}
