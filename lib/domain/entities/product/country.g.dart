// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: (json['id'] as num).toInt(),
      titleTm: json['title'] as String? ?? '',
      titleRu: json['title_ru'] as String?,
      flag: imageFromJson(json['flag'] as String?),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.titleTm,
      'title_ru': instance.titleRu,
      'flag': instance.flag,
    };
