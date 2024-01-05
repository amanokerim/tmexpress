// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination<T> _$PaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Pagination<T>(
      count: json['count'] as int? ?? 0,
      results:
          (json['results'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PaginationToJson<T>(
  Pagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'results': instance.results.map(toJsonT).toList(),
    };
