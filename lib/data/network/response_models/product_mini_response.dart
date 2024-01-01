import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product/country.dart';

part 'product_mini_response.g.dart';

@JsonSerializable()
class ProductMiniResponse {
  ProductMiniResponse({
    this.id,
    this.title,
    this.titleRu,
    this.ourRating,
    this.discount,
    this.normalPrice,
    this.imageMini,
    this.country,
  });
  factory ProductMiniResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductMiniResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductMiniResponseToJson(this);

  final int? id;
  final String? title;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  final double? ourRating;
  final int? discount;
  final double? normalPrice;
  final String? imageMini;
  final Country? country;
}
