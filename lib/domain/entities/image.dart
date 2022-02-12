import 'package:equatable/equatable.dart';

class Image extends Equatable {
  const Image({
    required this.id,
    required this.url,
    required this.urlMini,
    required this.width,
    required this.height,
  });

  final int id;
  final String url;
  final String urlMini;
  final double width;
  final double height;

  @override
  List<Object?> get props => [id];
}
