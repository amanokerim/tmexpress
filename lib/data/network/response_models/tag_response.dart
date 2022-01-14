import 'package:json_annotation/json_annotation.dart';

part 'tag_response.g.dart';

@JsonSerializable()
class TagResponse {
  TagResponse({
    this.id,
    this.title,
    this.product,
  });
  factory TagResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TagResponseToJson(this);

  final int? id;
  final String? title;
  // TODO Change to ProductMiniResponse
  final List<int>? product;
}
