// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      titleRu: json['title_ru'] as String?,
      description: json['description'] as String?,
      video: json['video'] as String?,
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
      expressPriceW: (json['expressPriceW'] as num?)?.toDouble(),
      normalPriceW: (json['normalPriceW'] as num?)?.toDouble(),
      wholesaleLimit: json['wholesaleLimit'] as int?,
      sizeTable: json['size_table'] as String?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_ru': instance.titleRu,
      'description': instance.description,
      'video': instance.video,
      'weight': instance.weight,
      'ourRating': instance.ourRating,
      'discount': instance.discount,
      'productImages': instance.productImages,
      'size': instance.size,
      'expressPrice': instance.expressPrice,
      'normalPrice': instance.normalPrice,
      'expressPriceW': instance.expressPriceW,
      'normalPriceW': instance.normalPriceW,
      'wholesaleLimit': instance.wholesaleLimit,
      'size_table': instance.sizeTable,
    };
