// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      urlMini: json['urlMini'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      alt: json['alt'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'urlMini': instance.urlMini,
      'width': instance.width,
      'height': instance.height,
      'alt': instance.alt,
    };
