import 'package:json_annotation/json_annotation.dart';

import 'image_response.dart';
import 'size_response.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  const ProductResponse({
    this.id,
    this.title,
    this.description,
    this.weight,
    this.ourRating,
    this.discount,
    this.productImages,
    this.size,
    this.expressPrice,
    this.normalPrice,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  final int? id;
  final String? title;
  final String? description;
  final double? weight;
  final double? ourRating;
  final double? discount;
  final List<ImageResponse>? productImages;
  final List<SizeResponse>? size;
  final double? expressPrice;
  final double? normalPrice;
}
