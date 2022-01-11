// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      categoryImage: json['categoryImage'] as String?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => GroupResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categoryImage': instance.categoryImage,
      'groups': instance.groups,
    };
