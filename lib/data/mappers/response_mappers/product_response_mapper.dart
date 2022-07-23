import 'package:injectable/injectable.dart';

import '../../../domain/entities/product/product.dart';
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
  Product map(ProductResponse? entity) => Product(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        description: entity?.description ?? '',
        weight: entity?.weight ?? 0,
        ourRating: entity?.ourRating ?? 0,
        discount: entity?.discount ?? 0,
        productImages: _imageResponseMapper.mapList(entity?.productImages),
        size: _sizeResponseMapper.mapList(entity?.size),
        expressPrice: entity?.expressPrice ?? 0,
        normalPrice: entity?.normalPrice ?? 0,
        expressPriceW: entity?.expressPriceW ?? 0,
        normalPriceW: entity?.normalPriceW ?? 0,
        wholesaleLimit: entity?.wholesaleLimit ?? 0,
        isLiked: false,
      );
}
