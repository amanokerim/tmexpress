import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Pagination<T> {
  Pagination({
    required this.count,
    required this.results,
    this.next,
  });

  factory Pagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$PaginationToJson(this, toJsonT);

  @JsonKey(defaultValue: 0)
  final int count;

  final String? next;

  @JsonKey(defaultValue: [])
  final List<T> results;
}
