import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/product/banner.dart';
import '../../network/response_models/banner_response.dart';
import '../mapper.dart';

@lazySingleton
class BannerResponseMapper extends Mapper<BannerResponse, Banner> {
  @override
  Banner map(BannerResponse? entity) => Banner(
        title: entity?.title ?? '',
        image: '${Env.value.baseUrl}${entity?.image}',
        type: stringToBannerType(entity?.type),
        entityId: entity?.entityId ?? 0,
      );

  BannerType stringToBannerType(String? str) {
    switch (str) {
      case 'CATEGORY':
        return BannerType.category;
      case 'TAG':
        return BannerType.tag;
      default:
        return BannerType.product;
    }
  }
}
