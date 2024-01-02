import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/product/banner.dart';
import '../../../main.dart';
import '../../network/response_models/banner_response.dart';
import '../mapper.dart';

@lazySingleton
class BannerResponseMapper extends Mapper<BannerResponse, Banner> {
  @override
  Banner map(BannerResponse? entity) {
    return Banner(
      title: (isRu ? entity?.titleRu : null) ?? entity?.title ?? '',
      image: '${Env.value.baseUrl}${entity?.image}',
      type: stringToBannerType(entity?.type),
      size: stringToBannerSize(entity?.size),
      entityId: entity?.entityId ?? 0,
    );
  }

  BannerType stringToBannerType(String? str) {
    switch (str) {
      case 'CATEGORY':
        return BannerType.category;
      case 'TAG':
        return BannerType.tag;
      case 'MEDIA':
        return BannerType.media;
      default:
        return BannerType.product;
    }
  }

  BannerSize stringToBannerSize(String? str) {
    switch (str) {
      case 'B':
        return BannerSize.b;
      case 'C':
        return BannerSize.c;
      case 'D':
        return BannerSize.d;
      case 'E':
        return BannerSize.e;
      case 'F':
        return BannerSize.f;
      case 'G':
        return BannerSize.g;
      case 'H':
        return BannerSize.h;
      default:
        return BannerSize.a;
    }
  }
}
