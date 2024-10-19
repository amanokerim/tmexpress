// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryResponse _$SubcategoryResponseFromJson(Map<String, dynamic> json) =>
    SubcategoryResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      titleRu: json['title_ru'] as String?,
      subCategoryImage: json['subCategoryImage'] as String?,
      subcategorysizes: (json['subcategorysizes'] as List<dynamic>?)
          ?.map((e) => SizeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubcategoryResponseToJson(
        SubcategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_ru': instance.titleRu,
      'subCategoryImage': instance.subCategoryImage,
      'subcategorysizes': instance.subcategorysizes,
    };
