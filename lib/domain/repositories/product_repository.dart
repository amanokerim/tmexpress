import 'package:dartz/dartz.dart';

import '../entities/product/brand.dart';
import '../entities/product/category.dart';
import '../entities/product/home.dart';
import '../entities/product/pagination.dart';
import '../entities/product/product.dart';
import '../entities/product/product_mini.dart';
import '../entities/product/size.dart';
import '../entities/saved_product.dart';
import '../errors/app_error.dart';
import '../usecases/products/fetch_products_usecase.dart';
import '../usecases/products/search_product_usecase.dart';

abstract class ProductRepository {
  Future<Either<AppError, List<Category>>> fetchCategories();

  Future<Either<AppError, PaginationM<Brand>>> fetchBrands(String? next);

  Future<Either<AppError, Home>> fetchHome();

  Future<Either<AppError, PaginationM<ProductMini>>> fetchProducts(
      FetchProductsParams params);

  Future<Either<AppError, PaginationM<ProductMini>>> fetchHotProducts(
      String? next);

  Future<Either<AppError, PaginationM<ProductMini>>> searchProducts(
      SearchParams params);

  Future<Either<AppError, Product>> fetchProduct(int id);

  Future<Either<AppError, void>> toggleLike(SavedProduct product);

  Future<Either<AppError, void>> share(int id);

  Future<Either<AppError, List<Size>>> fetchSubcategorySizes(int id);

  Future<Either<AppError, List<SavedProduct>>> fetchFavoriteProducts();
}
