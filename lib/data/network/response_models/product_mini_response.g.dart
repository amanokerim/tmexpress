// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mini_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMiniResponse _$ProductMiniResponseFromJson(Map<String, dynamic> json) =>
    ProductMiniResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      ourRating: (json['ourRating'] as num?)?.toDouble(),
      discount: json['discount'] as int?,
      normalPrice: (json['normalPrice'] as num?)?.toDouble(),
      imageMini: json['imageMini'] as String?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductMiniResponseToJson(
        ProductMiniResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'ourRating': instance.ourRating,
      'discount': instance.discount,
      'normalPrice': instance.normalPrice,
      'imageMini': instance.imageMini,
      'country': instance.country,
    };
