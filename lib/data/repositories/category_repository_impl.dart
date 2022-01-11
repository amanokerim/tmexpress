import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category/category.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/category_repository.dart';
import '../error/exception_handler.dart';
import '../mappers/response_mappers/category_response_mapper.dart';
import '../network/common_network.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(
      this._exception, this._commonNetwork, this._categoryResponseMapper);
  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final CategoryResponseMapper _categoryResponseMapper;

  @override
  Future<Either<Failure, List<Category>>> fetchCategories() {
    return _exception.handle(() async {
      final categories = await _commonNetwork
          .fetchCategories()
          .then(_categoryResponseMapper.mapList);
      return categories;
    });
  }
}
