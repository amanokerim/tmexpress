import 'package:json_annotation/json_annotation.dart';

import 'size_response.dart';
part 'subcategory_response.g.dart';

@JsonSerializable()
class SubcategoryResponse {
  SubcategoryResponse({
    this.id,
    this.title,
    this.titleRu,
    this.subCategoryImage,
    this.subcategorysizes,
  });
  factory SubcategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryResponseToJson(this);

  final int? id;
  final String? title;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  final String? subCategoryImage;
  final List<SizeResponse>? subcategorysizes;
}
