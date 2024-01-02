import 'package:json_annotation/json_annotation.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  const BannerResponse({
    this.title,
    this.titleRu,
    this.image,
    this.type,
    this.size,
    this.entityId,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);

  final String? title;
  @JsonKey(name: 'title_ru')
  final String? titleRu;
  final String? image;
  final String? type;
  final String? size;
  final int? entityId;
}
