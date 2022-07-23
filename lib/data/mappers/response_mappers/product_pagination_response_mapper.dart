import 'package:injectable/injectable.dart';

import '../../../domain/entities/product/product_mini.dart';
import '../../network/response_models/product_mini_response.dart';
import '../pagination_response_mapper.dart';
import 'product_mini_response_mapper.dart';

@lazySingleton
class ProductPaginationResponseMapper
    extends PaginationResponseMapper<ProductMiniResponse, ProductMini> {
  ProductPaginationResponseMapper(ProductMiniResponseMapper mapper)
      : super(mapper);
}
