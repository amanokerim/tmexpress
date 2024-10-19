// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaCategory _$MediaCategoryFromJson(Map<String, dynamic> json) =>
    MediaCategory(
      id: (json['id'] as num).toInt(),
      titleTm: json['title'] as String,
      titleRu: json['title_ru'] as String?,
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$MediaCategoryToJson(MediaCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.titleTm,
      'title_ru': instance.titleRu,
      'icon': instance.icon,
    };
