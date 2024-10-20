// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      video: json['video'] as String,
      weight: (json['weight'] as num).toDouble(),
      ourRating: (json['ourRating'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      productImages: (json['productImages'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Image.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      size: (json['size'] as List<dynamic>)
          .map((e) => Size.fromJson(e as Map<String, dynamic>))
          .toList(),
      normalPrice: (json['normalPrice'] as num).toDouble(),
      normalPriceW: (json['normalPriceW'] as num).toDouble(),
      wholesaleLimit: (json['wholesaleLimit'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
      sizeTable: json['sizeTable'] as String,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      onStock: json['onStock'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'video': instance.video,
      'weight': instance.weight,
      'ourRating': instance.ourRating,
      'discount': instance.discount,
      'productImages': instance.productImages
          .map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'size': instance.size.map((e) => e.toJson()).toList(),
      'normalPrice': instance.normalPrice,
      'normalPriceW': instance.normalPriceW,
      'wholesaleLimit': instance.wholesaleLimit,
      'isLiked': instance.isLiked,
      'onStock': instance.onStock,
      'sizeTable': instance.sizeTable,
      'country': instance.country?.toJson(),
      'brand': instance.brand?.toJson(),
    };
