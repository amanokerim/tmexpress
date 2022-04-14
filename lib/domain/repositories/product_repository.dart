import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../entities/home.dart';
import '../entities/pagination.dart';
import '../entities/product.dart';
import '../entities/product_mini.dart';
import '../entities/saved_product.dart';
import '../entities/size.dart';
import '../errors/app_error.dart';
import '../usecases/products/fetch_products_usecase.dart';

abstract class ProductRepository {
  Future<Either<AppError, List<Category>>> fetchCategories();

  Future<Either<AppError, Home>> fetchHome();

  Future<Either<AppError, Pagination<ProductMini>>> fetchProducts(
      FetchProductsParams params);

  Future<Either<AppError, Pagination<ProductMini>>> fetchHotProducts(
      String? next);

  Future<Either<AppError, Product>> fetchProduct(int id);

  Future<Either<AppError, void>> toggleLike(SavedProduct product);

  Future<Either<AppError, void>> share(int id);

  Future<Either<AppError, List<Size>>> fetchSubcategorySizes(int id);

  Future<Either<AppError, List<SavedProduct>>> fetchFavoriteProducts();
}
