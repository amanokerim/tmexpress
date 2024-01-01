import 'package:json_annotation/json_annotation.dart';

import 'group_response.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  const CategoryResponse({
    this.id,
    this.title,
    this.titleRu,
    this.categoryImage,
    this.groups,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  final int? id;
  final String? title;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  final String? categoryImage;
  final List<GroupResponse>? groups;
}
