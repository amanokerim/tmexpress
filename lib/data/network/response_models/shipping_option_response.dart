import 'package:json_annotation/json_annotation.dart';

part 'shipping_option_response.g.dart';

@JsonSerializable()
class ShippingOptionResponse {
  ShippingOptionResponse({
    this.id,
    this.title,
    this.titleRu,
    this.image,
    this.price,
  });
  factory ShippingOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingOptionResponseToJson(this);

  final int? id;
  final String? title;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  final String? image;
  final double? price;
}
