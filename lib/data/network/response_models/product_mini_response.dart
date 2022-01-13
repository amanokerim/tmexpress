import 'package:json_annotation/json_annotation.dart';

part 'product_mini_response.g.dart';

@JsonSerializable()
class ProductMiniResponse {
  ProductMiniResponse({
    this.id,
    this.title,
    this.ourRating,
    this.discount,
    this.normalPrice,
    this.imageMini,
  });
  factory ProductMiniResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductMiniResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductMiniResponseToJson(this);

  final int? id;
  final String? title;
  // TODO Change ourRating to double
  final String? ourRating;
  final double? discount;
  final double? normalPrice;
  final String? imageMini;
}
