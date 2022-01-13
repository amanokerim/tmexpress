import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/banner.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/tag.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/product_repository.dart';
import '../error/exception_handler.dart';
import '../mappers/response_mappers/banner_response_mapper.dart';
import '../mappers/response_mappers/category_response_mapper.dart';
import '../mappers/response_mappers/tag_respose_mapper.dart';
import '../network/common_network.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
      this._exception,
      this._commonNetwork,
      this._categoryResponseMapper,
      this._bannerResponseMapper,
      this._tagResponseMapper);
  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final CategoryResponseMapper _categoryResponseMapper;
  final BannerResponseMapper _bannerResponseMapper;
  final TagResponseMapper _tagResponseMapper;

  @override
  Future<Either<Failure, List<Category>>> fetchCategories() {
    return _exception.handle(() async {
      final categories = await _commonNetwork
          .fetchCategories()
          .then(_categoryResponseMapper.mapList);
      return categories;
    });
  }

  @override
  Future<Either<Failure, List<Banner>>> fetchBanners() {
    return _exception.handle(() async {
      final banners = await _commonNetwork
          .fetchBanners()
          .then(_bannerResponseMapper.mapList);
      return banners;
    });
  }

  @override
  Future<Either<Failure, List<Tag>>> fetchTags() {
    return _exception.handle(() async {
      final tags =
          await _commonNetwork.fetchTags().then(_tagResponseMapper.mapList);
      return tags;
    });
  }
}
