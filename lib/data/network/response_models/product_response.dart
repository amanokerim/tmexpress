import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product/brand.dart';
import '../../../domain/entities/product/country.dart';
import 'image_response.dart';
import 'size_response.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  const ProductResponse({
    this.id,
    this.title,
    this.titleRu,
    this.description,
    this.descriptionRu,
    this.video,
    this.weight,
    this.ourRating,
    this.discount,
    this.productImages,
    this.size,
    this.expressPrice,
    this.normalPrice,
    this.expressPriceW,
    this.normalPriceW,
    this.wholesaleLimit,
    this.sizeTable,
    this.country,
    this.brand,
    this.onStock = false,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  final int? id;
  final String? title;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  final String? description;
  @JsonKey(name: 'description_ru')
  final String? descriptionRu;
  final String? video;
  final double? weight;
  final double? ourRating;
  final double? discount;
  final List<ImageResponse>? productImages;
  final List<SizeResponse>? size;
  final double? expressPrice;
  final double? normalPrice;
  final double? expressPriceW;
  final double? normalPriceW;
  final int? wholesaleLimit;
  @JsonKey(name: 'size_table')
  final String? sizeTable;
  final Country? country;
  final Brand? brand;
  @JsonKey(name: 'on_stock')
  final bool onStock;
}
