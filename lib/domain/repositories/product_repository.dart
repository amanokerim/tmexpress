import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../entities/home.dart';
import '../entities/pagination.dart';
import '../entities/product.dart';
import '../entities/product_mini.dart';
import '../entities/saved_product.dart';
import '../entities/size.dart';
import '../errors/failures.dart';
import '../usecases/products/fetch_products_usecase.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Category>>> fetchCategories();

  Future<Either<Failure, Home>> fetchHome();

  Future<Either<Failure, Pagination<ProductMini>>> fetchProducts(
      FetchProductsParams params);

  Future<Either<Failure, Pagination<ProductMini>>> fetchHotProducts(
      String? next);

  Future<Either<Failure, Product>> fetchProduct(int id);

  Future<Either<Failure, void>> toggleLike(SavedProduct product);

  Future<Either<Failure, void>> share(int id);

  Future<Either<Failure, List<Size>>> fetchSubcategorySizes(int id);

  Future<Either<Failure, List<SavedProduct>>> fetchFavoriteProducts();
}
