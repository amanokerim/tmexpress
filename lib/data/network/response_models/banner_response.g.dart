// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      title: json['title'] as String?,
      titleRu: json['title_ru'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      size: json['size'] as String?,
      entityId: json['entityId'] as int?,
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'title_ru': instance.titleRu,
      'image': instance.image,
      'type': instance.type,
      'size': instance.size,
      'entityId': instance.entityId,
    };
