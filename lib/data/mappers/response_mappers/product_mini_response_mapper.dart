import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/product/product_mini.dart';
import '../../../main.dart';
import '../../network/response_models/product_mini_response.dart';
import '../mapper.dart';

@lazySingleton
class ProductMiniResponseMapper
    extends Mapper<ProductMiniResponse, ProductMini> {
  @override
  ProductMini map(ProductMiniResponse? entity) {
    return ProductMini(
      id: entity?.id ?? 0,
      title: (isRu ? entity?.titleRu : null) ?? entity?.title ?? '',
      ourRating: entity?.ourRating ?? 0,
      discount: entity?.discount ?? 0,
      normalPrice: entity?.normalPrice ?? 0,
      imageMini:
          (entity?.imageMini ?? '').isNotEmpty && entity?.imageMini != '-'
              ? '${Env.value.baseUrl}media/${entity?.imageMini}'
              : '',
      country: entity?.country,
    );
  }
}
