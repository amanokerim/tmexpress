// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    GroupResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      titleRu: json['title_ru'] as String?,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => SubcategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupResponseToJson(GroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_ru': instance.titleRu,
      'subCategories': instance.subCategories?.map((e) => e.toJson()).toList(),
    };
