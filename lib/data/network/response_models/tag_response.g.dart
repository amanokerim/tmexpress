// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagResponse _$TagResponseFromJson(Map<String, dynamic> json) => TagResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => ProductMiniResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TagResponseToJson(TagResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'product': instance.product,
    };
