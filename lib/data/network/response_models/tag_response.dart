import 'package:json_annotation/json_annotation.dart';

import 'product_mini_response.dart';

part 'tag_response.g.dart';

@JsonSerializable()
class TagResponse {
  TagResponse({
    this.id,
    this.title,
    this.titleRu,
    this.product,
  });
  factory TagResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TagResponseToJson(this);

  final int? id;
  final String? title;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  final List<ProductMiniResponse>? product;
}
