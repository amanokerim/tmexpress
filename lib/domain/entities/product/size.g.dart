// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Size _$SizeFromJson(Map<String, dynamic> json) => Size(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'selected': instance.selected,
    };
