import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/image.dart';
import '../../../domain/entities/product/product.dart';
import '../../../main.dart';
import '../../network/response_models/product_response.dart';
import '../mapper.dart';
import 'image_response_mapper.dart';
import 'size_response_mapper.dart';

@lazySingleton
class ProductResponseMapper extends Mapper<ProductResponse, Product> {
  ProductResponseMapper(this._imageResponseMapper, this._sizeResponseMapper);
  final ImageResponseMapper _imageResponseMapper;
  final SizeResponseMapper _sizeResponseMapper;

  @override
  Product map(ProductResponse? entity) {
    final video = entity?.video ?? '';
    final imageMap = <String, List<Image>>{};
    final images = _imageResponseMapper.mapList(entity?.productImages).toList();
    for (var i = 0; i < images.length; i++) {
      if (imageMap.containsKey(images[i].alt)) {
        imageMap[images[i].alt] = [...imageMap[images[i].alt]!, images[i]];
      } else {
        imageMap[images[i].alt] = [images[i]];
      }
    }

    return Product(
      id: entity?.id ?? 0,
      title: (isRu ? entity?.titleRu : null) ?? entity?.title ?? '',
      description:
          (isRu ? entity?.descriptionRu : null) ?? entity?.description ?? '',
      video: '${Env.value.baseUrl}$video',
      weight: entity?.weight ?? 0,
      ourRating: entity?.ourRating ?? 0,
      discount: entity?.discount ?? 0,
      productImages: imageMap,
      size: _sizeResponseMapper.mapList(entity?.size),
      normalPrice: entity?.normalPrice ?? 0,
      normalPriceW: entity?.normalPriceW ?? 0,
      wholesaleLimit: entity?.wholesaleLimit ?? 0,
      isLiked: false,
      sizeTable: (entity?.sizeTable ?? '').isNotEmpty
          ? '${Env.value.baseUrl}${entity?.sizeTable}'
          : '',
      country: entity?.country,
      onStock: entity?.onStock ?? false,
    );
  }
}
