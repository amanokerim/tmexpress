// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      count: (json['count'] as num).toInt(),
      size: Size.fromJson(json['size'] as Map<String, dynamic>),
      color: Image.fromJson(json['color'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      expressPrice: (json['expressPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'product': instance.product.toJson(),
      'count': instance.count,
      'size': instance.size.toJson(),
      'color': instance.color.toJson(),
      'price': instance.price,
      'expressPrice': instance.expressPrice,
    };
