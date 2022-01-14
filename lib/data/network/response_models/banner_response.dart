import 'package:json_annotation/json_annotation.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  const BannerResponse({
    this.title,
    this.image,
    this.type,
    this.entityId,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);

  final String? title;
  final String? image;
  final String? type;
  final int? entityId;
}
