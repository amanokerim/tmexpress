import 'package:json_annotation/json_annotation.dart';

import 'group_response.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  const CategoryResponse({
    this.id,
    this.title,
    this.categoryImage,
    this.groups,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  final int? id;
  final String? title;
  final String? categoryImage;
  final List<GroupResponse>? groups;
}
