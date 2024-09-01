import 'package:json_annotation/json_annotation.dart';

import '../../../presentation/utils/string_extension.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);

  final int id;

  @JsonKey(defaultValue: '')
  final String name;

  @JsonKey(fromJson: imageFromJson)
  final String image;
}
