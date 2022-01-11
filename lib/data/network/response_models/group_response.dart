import 'package:json_annotation/json_annotation.dart';

import 'subcategory_response.dart';

part 'group_response.g.dart';

@JsonSerializable()
class GroupResponse {
  const GroupResponse({
    this.id,
    this.title,
    this.subCategories,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GroupResponseToJson(this);

  final int? id;
  final String? title;
  final List<SubcategoryResponse>? subCategories;
}
