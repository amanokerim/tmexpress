import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/category/category.dart';
import '../../errors/failures.dart';
import '../../repositories/category_repository.dart';
import '../usecase.dart';

@lazySingleton
class FetchProductsUseCase extends UseCaseWithoutParams<List<Category>> {
  FetchProductsUseCase(this._categoryRepository);
  final CategoryRepository _categoryRepository;

  @override
  Future<Either<Failure, List<Category>>> call() {
    return _categoryRepository.fetchCategories();
  }
}
