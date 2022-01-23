import 'package:equatable/equatable.dart';

class Image extends Equatable {
  const Image({
    required this.id,
    required this.url,
    required this.urlMini,
  });

  final int id;
  final String url;
  final String urlMini;

  @override
  List<Object?> get props => [id];
}
