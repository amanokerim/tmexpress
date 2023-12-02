import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/product/product_mini.dart';
import '../../network/response_models/product_mini_response.dart';
import '../mapper.dart';

@lazySingleton
class ProductMiniResponseMapper
    extends Mapper<ProductMiniResponse, ProductMini> {
  @override
  ProductMini map(ProductMiniResponse? entity) {
    print('${Env.value.baseUrl}/${entity?.imageMini}');
    return ProductMini(
      id: entity?.id ?? 0,
      title: entity?.title ?? '',
      ourRating: entity?.ourRating ?? 0,
      discount: entity?.discount ?? 0,
      normalPrice: entity?.normalPrice ?? 0,
      imageMini: '${Env.value.baseUrl}/media/${entity?.imageMini}',
    );
  }
}
