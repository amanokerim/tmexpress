// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingOptionResponse _$ShippingOptionResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingOptionResponse(
      title: json['title'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShippingOptionResponseToJson(
        ShippingOptionResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
    };
