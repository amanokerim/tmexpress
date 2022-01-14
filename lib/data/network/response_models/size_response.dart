import 'package:json_annotation/json_annotation.dart';

part 'size_response.g.dart';

@JsonSerializable()
class SizeResponse {
  const SizeResponse({
    this.id,
    this.title,
  });

  factory SizeResponse.fromJson(Map<String, dynamic> json) =>
      _$SizeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SizeResponseToJson(this);

  final int? id;
  final String? title;
}
