import 'package:json_annotation/json_annotation.dart';

import 'image_response.dart';
import 'product_mini_response.dart';
import 'size_response.dart';

part 'placed_order_item_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PlacedOrderItemResponse {
  const PlacedOrderItemResponse({
    this.product,
    this.qty,
    this.size,
    this.color,
    this.productPrice,
  });

  factory PlacedOrderItemResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacedOrderItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlacedOrderItemResponseToJson(this);

  final ProductMiniResponse? product;
  final int? qty;
  final SizeResponse? size;
  final ImageResponse? color;
  final double? productPrice;
}
