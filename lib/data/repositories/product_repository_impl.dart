import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/enums/sort_types.dart';
import '../../domain/entities/product/category.dart';
import '../../domain/entities/product/home.dart';
import '../../domain/entities/product/pagination.dart';
import '../../domain/entities/product/product.dart';
import '../../domain/entities/product/product_mini.dart';
import '../../domain/entities/product/size.dart';
import '../../domain/entities/product/tag.dart';
import '../../domain/entities/saved_product.dart';
import '../../domain/errors/app_error.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/products/fetch_products_usecase.dart';
import '../../domain/usecases/products/search_product_usecase.dart';
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
      this._sizeRespMapper,
      this.favoritesBox);

  final ExceptionHandler _exception;
  final CommonNetwork _commonNetwork;
  final AuthNetwork _authNetwork;
  final CategoryResponseMapper _categoryResponseMapper;
  final BannerResponseMapper _bannerResponseMapper;
  final TagResponseMapper _tagResponseMapper;
  final ProductPaginationResponseMapper _productPaginationResponseMapper;
  final ProductResponseMapper _productResponseMapper;
  final SizeResponseMapper _sizeRespMapper;
  final Box<dynamic> favoritesBox;

  @override
  Future<Either<AppError, List<Category>>> fetchCategories() {
    return _exception.handle(() async {
      final categories = await _commonNetwork
          .fetchCategories()
          .then(_categoryResponseMapper.mapList);
      return categories;
    });
  }

  @override
  Future<Either<AppError, Home>> fetchHome() {
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
  Future<Either<AppError, Pagination<ProductMini>>> fetchProducts(
      FetchProductsParams params) {
    return _exception.handle(() async {
      final offset = _getOffset(params.next);
      final id = params.productParent.id;
      final orderBy = params.sortType.orderBy;
      final isDiscounted =
          params.filterOptions?.isDiscounted == true ? 1 : null;
      final sizes = (params.filterOptions?.sizes ?? []).isEmpty
          ? null
          : params.filterOptions!.sizes.map((s) => s.id).join(',');

      final response = params.productParent is Tag
          ? _commonNetwork.fetchTagProducts(id, offset, kLimit, orderBy)
          : _commonNetwork.fetchSubcategoryProducts(id, offset, kLimit, orderBy,
              isDiscounted: isDiscounted, sizes: sizes);

      final products =
          await response.then(_productPaginationResponseMapper.map);
      return products;
    });
  }

  @override
  Future<Either<AppError, Product>> fetchProduct(int id) {
    return _exception.handle(() async {
      final product = await _commonNetwork
          .fetchProduct(id)
          .then(_productResponseMapper.map);
      if (favoritesBox.containsKey(product.id)) {
        return product.copyWith(isLiked: true);
      }
      return product;
    });
  }

  @override
  Future<Either<AppError, void>> toggleLike(SavedProduct product) {
    return _exception.handle(() async {
      final id = product.id;
      if (favoritesBox.containsKey(id)) {
        await _authNetwork.unLike(id);
        await favoritesBox.delete(id);
      } else {
        await _authNetwork.like(id);
        await favoritesBox.put(id, product.toJson());
      }
    });
  }

  @override
  Future<Either<AppError, void>> share(int id) {
    return _exception.handle(() async => _authNetwork.share(id));
  }

  @override
  Future<Either<AppError, Pagination<ProductMini>>> fetchHotProducts(
      String? next) {
    return _exception.handle(() async => _commonNetwork
        .fetchHotProducts(_getOffset(next), kLimit)
        .then(_productPaginationResponseMapper.map));
  }

  @override
  Future<Either<AppError, List<Size>>> fetchSubcategorySizes(int id) {
    return _exception.handle(() => _commonNetwork
        .fetchSubcategorySizes(id)
        .then((sub) => _sizeRespMapper.mapList(sub.subcategorysizes)));
  }

  @override
  Future<Either<AppError, List<SavedProduct>>> fetchFavoriteProducts() {
    return _exception.handle(
      () => favoritesBox.values.map((e) => SavedProduct.fromJson(e)).toList(),
    );
  }

  @override
  Future<Either<AppError, Pagination<ProductMini>>> searchProducts(
      SearchParams params) {
    return _exception.handle(() => _commonNetwork
        .searchProducts(params.query, _getOffset(params.next), kLimit)
        .then(_productPaginationResponseMapper.map));
  }

  String? _getOffset(String? next) {
    if (next != null) {
      final uri = Uri.parse(next);
      return uri.queryParameters['offset'];
    }
    return null;
  }
}
