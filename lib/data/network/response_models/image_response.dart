import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable()
class ImageResponse {
  const ImageResponse({
    this.id,
    this.url,
    this.urlMini,
    this.imageHeight,
    this.imageWidth,
    this.alt,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);

  final int? id;
  final String? url;
  final String? urlMini;
  final double? imageWidth;
  final double? imageHeight;
  final String? alt;
}
