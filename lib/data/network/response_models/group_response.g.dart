// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    GroupResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => SubcategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupResponseToJson(GroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subCategories': instance.subCategories,
    };
