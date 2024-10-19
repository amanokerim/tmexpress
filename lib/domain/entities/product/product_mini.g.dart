// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mini.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMini _$ProductMiniFromJson(Map<String, dynamic> json) => ProductMini(
      id: (json['id'] as num?)?.toInt() ?? 0,
      titleTm: json['title'] as String? ?? '',
      titleRu: json['title_ru'] as String?,
      ourRating: (json['ourRating'] as num?)?.toDouble() ?? 4,
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      normalPrice: (json['normalPrice'] as num?)?.toDouble() ?? 0,
      imageMini: json['imageMini'] == null
          ? ''
          : imageFromJson(json['imageMini'] as String?),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductMiniToJson(ProductMini instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.titleTm,
      'title_ru': instance.titleRu,
      'ourRating': instance.ourRating,
      'discount': instance.discount,
      'normalPrice': instance.normalPrice,
      'imageMini': instance.imageMini,
      'country': instance.country,
    };
