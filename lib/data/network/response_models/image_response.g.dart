// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      urlMini: json['urlMini'] as String?,
      imageHeight: (json['imageHeight'] as num?)?.toDouble(),
      imageWidth: (json['imageWidth'] as num?)?.toDouble(),
      alt: json['alt'] as String?,
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'urlMini': instance.urlMini,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'alt': instance.alt,
    };
