import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponse<T> {
  const PaginationResponse({
    this.count,
    this.next,
    this.results,
  });

  factory PaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T t) toJsonT) =>
      _$PaginationResponseToJson(this, toJsonT);

  final int? count;
  final String? next;
  final List<T>? results;
}
