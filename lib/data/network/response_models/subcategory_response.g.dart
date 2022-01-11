// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryResponse _$SubcategoryResponseFromJson(Map<String, dynamic> json) =>
    SubcategoryResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subCategoryImage: json['subCategoryImage'] as String?,
    );

Map<String, dynamic> _$SubcategoryResponseToJson(
        SubcategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subCategoryImage': instance.subCategoryImage,
    };
