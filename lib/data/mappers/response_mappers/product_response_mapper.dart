import 'package:injectable/injectable.dart';

import '../../../domain/entities/product.dart';
import '../../network/response_models/product_response.dart';
import '../mapper.dart';

@lazySingleton
class ProductResponseMapper extends Mapper<ProductResponse, Product> {
  @override
  Product? map(ProductResponse? entity) {
    return Product(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        price: entity?.price ?? 0,
        description: entity?.description ?? '',
        category: entity?.category ?? '',
        image: entity?.image ?? '');
  }
}
