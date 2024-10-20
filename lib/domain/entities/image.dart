import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image extends Equatable {
  const Image({
    required this.id,
    required this.url,
    required this.urlMini,
    required this.width,
    required this.height,
    required this.alt,
  });

  final int id;
  final String url;
  final String urlMini;
  final double width;
  final double height;
  final String alt;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  List<Object?> get props => [id];
}
