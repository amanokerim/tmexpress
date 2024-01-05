import 'package:json_annotation/json_annotation.dart';

import '../../../main.dart';

part 'media_category.g.dart';

@JsonSerializable()
class MediaCategory {
  MediaCategory({
    required this.id,
    required this.titleTm,
    required this.titleRu,
    required this.icon,
  });

  factory MediaCategory.fromJson(Map<String, dynamic> json) =>
      _$MediaCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$MediaCategoryToJson(this);

  final int id;

  @JsonKey(name: 'title')
  final String titleTm;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  String get title => (isRu ? titleRu : null) ?? titleTm;

  @JsonKey(defaultValue: '')
  final String icon;
}
