import 'package:json_annotation/json_annotation.dart';
part 'subcategory_response.g.dart';

@JsonSerializable()
class SubcategoryResponse {
  SubcategoryResponse({
    this.id,
    this.title,
    this.subCategoryImage,
  });
  factory SubcategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryResponseToJson(this);

  final int? id;
  final String? title;
  final String? subCategoryImage;
}
