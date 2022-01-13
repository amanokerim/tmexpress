// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      title: json['title'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      entityId: json['entityId'] as int?,
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'type': instance.type,
      'entityId': instance.entityId,
    };
