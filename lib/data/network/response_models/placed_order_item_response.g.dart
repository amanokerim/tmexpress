// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placed_order_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacedOrderItemResponse _$PlacedOrderItemResponseFromJson(
        Map<String, dynamic> json) =>
    PlacedOrderItemResponse(
      product: json['product'] == null
          ? null
          : ProductMiniResponse.fromJson(
              json['product'] as Map<String, dynamic>),
      qty: json['qty'] as int?,
      size: json['size'] == null
          ? null
          : SizeResponse.fromJson(json['size'] as Map<String, dynamic>),
      color: json['color'] == null
          ? null
          : ImageResponse.fromJson(json['color'] as Map<String, dynamic>),
      productPrice: (json['product_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlacedOrderItemResponseToJson(
        PlacedOrderItemResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      'qty': instance.qty,
      'size': instance.size,
      'color': instance.color,
      'product_price': instance.productPrice,
    };
