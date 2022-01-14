// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      ourRating: (json['ourRating'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      productImages: (json['productImages'] as List<dynamic>?)
          ?.map((e) => ImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      size: (json['size'] as List<dynamic>?)
          ?.map((e) => SizeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      expressPrice: (json['expressPrice'] as num?)?.toDouble(),
      normalPrice: (json['normalPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'weight': instance.weight,
      'ourRating': instance.ourRating,
      'discount': instance.discount,
      'productImages': instance.productImages,
      'size': instance.size,
      'expressPrice': instance.expressPrice,
      'normalPrice': instance.normalPrice,
    };
