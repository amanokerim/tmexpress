import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/home.dart';
import '../../domain/entities/pagination.dart';
import '../../domain/entities/product_mini.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/fetch_products_usecase.dart';
import '../error/exception_handler.dart';
import '../mappers/response_mappers/banner_response_mapper.dart';
import '../mappers/response_mappers/category_response_mapper.dart';
import '../mappers/response_mappers/product_pagination_response_mapper.dart';
import '../mappers/response_mappers/tag_respose_mapper.dart';
import '../network/common_network.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
      this._exception,
      this._commonNetwork,
      this._categoryResponseMapper,
      this._bannerResponseMapper,
      this._tagResponseMapper,
      this._productPaginationResponseMapper);
  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final CategoryResponseMapper _categoryResponseMapper;
  final BannerResponseMapper _bannerResponseMapper;
  final TagResponseMapper _tagResponseMapper;
  final ProductPaginationResponseMapper _productPaginationResponseMapper;

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
  Future<Either<Failure, Home>> fetchHome() {
    return _exception.handle(() async {
      final banners = await _commonNetwork
          .fetchBanners()
          .then(_bannerResponseMapper.mapList);
      final tags =
          await _commonNetwork.fetchTags().then(_tagResponseMapper.mapList);

      return Home(banners: banners, tags: tags);
    });
  }

  @override
  Future<Either<Failure, Pagination<ProductMini>>> fetchProducts(
      FetchProductsParams params) {
    return _exception.handle(() async {
      // if(params.next!=null)
      final response = params.type == ProductsScreenType.tag
          ? _commonNetwork.fetchTagProducts(params.id)
          : _commonNetwork.fetchSubcategoryProducts(params.id);

      final products =
          await response.then(_productPaginationResponseMapper.map);
      return products;
    });
  }
}
