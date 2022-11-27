import 'package:injectable/injectable.dart';

import '../../../domain/entities/order/placed_order_item.dart';
import '../../network/response_models/placed_order_item_response.dart';
import '../mapper.dart';
import 'image_response_mapper.dart';
import 'product_mini_response_mapper.dart';
import 'size_response_mapper.dart';

@lazySingleton
class PlacedOrderItemResponseMapper
    extends Mapper<PlacedOrderItemResponse, PlacedOrderItem> {
  PlacedOrderItemResponseMapper(this._productMiniResponseMapper,
      this._sizeResponseMapper, this._imageResponseMapper);

  final ProductMiniResponseMapper _productMiniResponseMapper;
  final SizeResponseMapper _sizeResponseMapper;
  final ImageResponseMapper _imageResponseMapper;

  @override
  PlacedOrderItem map(PlacedOrderItemResponse? entity) => PlacedOrderItem(
      product: _productMiniResponseMapper.map(entity?.product),
      qty: entity?.qty ?? 0,
      size: _sizeResponseMapper.map(entity?.size),
      color: _imageResponseMapper.map(entity?.color),
      price: entity?.productPrice ?? 0);
}
