import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/enums/sort_types.dart';
import '../../domain/entities/home.dart';
import '../../domain/entities/pagination.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_mini.dart';
import '../../domain/entities/size.dart';
import '../../domain/entities/tag.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/products/fetch_products_usecase.dart';
import '../../presentation/utils/constants.dart';
import '../error/exception_handler.dart';
import '../mappers/response_mappers/banner_response_mapper.dart';
import '../mappers/response_mappers/category_response_mapper.dart';
import '../mappers/response_mappers/product_pagination_response_mapper.dart';
import '../mappers/response_mappers/product_response_mapper.dart';
import '../mappers/response_mappers/size_response_mapper.dart';
import '../mappers/response_mappers/tag_response_mapper.dart';
import '../network/auth_network.dart';
import '../network/common_network.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
      this._exception,
      this._commonNetwork,
      this._authNetwork,
      this._categoryResponseMapper,
      this._bannerResponseMapper,
      this._tagResponseMapper,
      this._productPaginationResponseMapper,
      this._productResponseMapper,
      this._sizeRespMapper);

  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final AuthNetwork _authNetwork;
  final CategoryResponseMapper _categoryResponseMapper;
  final BannerResponseMapper _bannerResponseMapper;
  final TagResponseMapper _tagResponseMapper;
  final ProductPaginationResponseMapper _productPaginationResponseMapper;
  final ProductResponseMapper _productResponseMapper;
  final SizeResponseMapper _sizeRespMapper;

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
      String? offset;
      if (params.next != null) {
        final uri = Uri.parse(params.next!);
        offset = uri.queryParameters['offset'];
      }
      final id = params.productParent.id;
      final orderBy = params.sortType.orderBy;
      final response = params.productParent is Tag
          ? _commonNetwork.fetchTagProducts(id, offset, kLimit)
          : _commonNetwork.fetchSubcategoryProducts(
              id, offset, kLimit, orderBy);

      final products =
          await response.then(_productPaginationResponseMapper.map);
      return products;
    });
  }

  @override
  Future<Either<Failure, Product>> fetchProduct(int id) {
    return _exception.handle(() async {
      final product =
          _commonNetwork.fetchProduct(id).then(_productResponseMapper.map);

      return product;
    });
  }

  @override
  Future<Either<Failure, void>> like(int id) {
    return _exception.handle(() async {
      await _authNetwork.like(id);
    });
  }

  @override
  Future<Either<Failure, void>> share(int id) {
    return _exception.handle(() async {
      await _authNetwork.share(id);
    });
  }

  @override
  Future<Either<Failure, Pagination<ProductMini>>> fetchHotProducts(
      String? next) {
    return _exception.handle(() async {
      String? offset;
      if (next != null) {
        final uri = Uri.parse(next);
        offset = uri.queryParameters['offset'];
      }
      final response = _commonNetwork.fetchHotProducts(offset, kLimit);
      return response.then(_productPaginationResponseMapper.map);
    });
  }

  @override
  Future<Either<Failure, List<Size>>> fetchSubcategorySizes(int id) {
    return _exception.handle(() {
      return _commonNetwork.fetchSubcategorySizes(id).then(
            (sub) => _sizeRespMapper.mapList(sub.subcategorysizes),
          );
    });
  }
}
