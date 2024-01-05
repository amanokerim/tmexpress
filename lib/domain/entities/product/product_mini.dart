import 'package:json_annotation/json_annotation.dart';

import '../../../main.dart';
import '../../../presentation/utils/string_extension.dart';
import 'country.dart';

part 'product_mini.g.dart';

@JsonSerializable()
class ProductMini {
  ProductMini({
    required this.id,
    required this.titleTm,
    required this.titleRu,
    required this.ourRating,
    required this.discount,
    required this.normalPrice,
    required this.imageMini,
    required this.country,
  });

  factory ProductMini.fromJson(Map<String, dynamic> json) =>
      _$ProductMiniFromJson(json);
  Map<String, dynamic> toJson() => _$ProductMiniToJson(this);

  @JsonKey(defaultValue: 0)
  final int id;

  @JsonKey(defaultValue: '', name: 'title')
  final String titleTm;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  String get title => (isRu ? titleRu : null) ?? titleTm;

  @JsonKey(defaultValue: 4)
  final double ourRating;

  @JsonKey(defaultValue: 0)
  final int discount;

  @JsonKey(defaultValue: 0)
  final double normalPrice;

  @JsonKey(defaultValue: '', fromJson: imageFromJson)
  final String imageMini;

  final Country? country;
}
